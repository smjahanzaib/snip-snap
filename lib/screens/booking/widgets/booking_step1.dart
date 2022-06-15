import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/booking/booking_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/booking/widgets/service_header_delegate.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

class BookingStep1 extends StatefulWidget {
  const BookingStep1({
    Key key,
    this.preselectedService,
  }) : super(key: key);

  final ServiceModel preselectedService;

  @override
  _BookingStep1State createState() => _BookingStep1State();
}

class _BookingStep1State extends State<BookingStep1> {
  @override
  void initState() {
    super.initState();

    if (widget.preselectedService != null) {
      context
          .read<BookingBloc>()
          .add(ServiceSelectedBookingEvent(service: widget.preselectedService));
    }
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: ServiceHeaderDelegate(
        minHeight: kPaddingM * 3,
        maxHeight: kPaddingM * 4,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                child: StrutText(
                  headerText,
                  style: Theme.of(context).textTheme.headline5.w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (BuildContext context, BookingState state) {
        final BookingSessionModel session =
            (state as SessionRefreshSuccessBookingState).session;

        if (session.location.serviceGroups.isEmpty) {
          return Container(
            alignment: AlignmentDirectional.center,
            child: Jumbotron(
              title: L10n.of(context).bookingWarningNoServices,
              icon: Icons.report,
            ),
          );
        }

        final List<Widget> _slivers = <Widget>[];

        for (int i = 0; i < session.location.serviceGroups.length; i++) {
          _slivers.add(makeHeader(session.location.serviceGroups[i].name));
          _slivers.add(SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<ListItem>.generate(
                        session.location.serviceGroups[i].services.length,
                        (int index) {
                      return _serviceItem(
                          session.location.serviceGroups[i].services[index],
                          session);
                    }),
                  ),
                ),
              ],
            ),
          ));
        }

        return CustomScrollView(slivers: _slivers);
      },
    );
  }

  ListItem _serviceItem(
      ServiceModel serviceModel, BookingSessionModel session) {
    return ListItem(
      leading: Checkbox(
        value: session.selectedServiceIds.contains(serviceModel.id),
        onChanged: (bool isChecked) {
          setState(() {
            if (isChecked) {
              context
                  .read<BookingBloc>()
                  .add(ServiceSelectedBookingEvent(service: serviceModel));
            } else {
              context
                  .read<BookingBloc>()
                  .add(ServiceUnselectedBookingEvent(service: serviceModel));
            }
          });
        },
      ),
      title: serviceModel.name,
      titleTextStyle: Theme.of(context).textTheme.subtitle1.fs18.w500,
      subtitle: serviceModel.description,
      subtitleTextStyle: Theme.of(context)
          .textTheme
          .bodyText1
          .w300
          .copyWith(color: Theme.of(context).hintColor),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          StrutText(
            L10n.of(context).commonCurrencyFormat(
                sprintf('%.2f', <double>[serviceModel.price])),
            style: Theme.of(context).textTheme.subtitle1.fs18.w500,
          ),
          StrutText(
            L10n.of(context)
                .commonDurationFormat(serviceModel.duration.toString()),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .w300
                .copyWith(color: Theme.of(context).hintColor),
          ),
        ],
      ),
      onPressed: () {
        setState(() {
          if (session.selectedServiceIds.contains(serviceModel.id)) {
            context
                .read<BookingBloc>()
                .add(ServiceUnselectedBookingEvent(service: serviceModel));
          } else {
            context
                .read<BookingBloc>()
                .add(ServiceSelectedBookingEvent(service: serviceModel));
          }
        });
      },
    );
  }
}
