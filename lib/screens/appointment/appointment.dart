import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/appointment/appointment_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/appointment/widgets/appointment_header.dart';
import 'package:SnipSnap/screens/appointment/widgets/appointment_tabbar.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/card_divider.dart';
import 'package:SnipSnap/widgets/link_button.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/list_title.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/portrait_mode_mixin.dart';
import 'package:SnipSnap/widgets/sliver_app_title.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    Key key,
    this.appointment,
  }) : super(key: key);

  final AppointmentModel appointment;

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>
    with PortraitStatefulModeMixin<AppointmentScreen> {
  AppointmentModel _appointment;
  AppointmentBloc _bloc;

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _appointment = widget.appointment;
    _bloc = BlocProvider.of<AppointmentBloc>(context);
  }

  void cancelReservation() {
    UI.confirmationDialogBox(
      context,
      message: L10n.of(context).appointmentCancelationConfirmation,
      onConfirmation: () {
        setState(() => _isLoading = true);
        _bloc.add(CanceledAppointmentEvent(id: widget.appointment.id));
      },
    );
  }

  Future<void> showNotesEditor() async {
    final String editedNotes = await Navigator.pushNamed(
        context, Routes.bookingNotes,
        arguments: widget.appointment.notes);
    if (editedNotes != null) {
      _bloc.add(NotesUpdatedAppointmentEvent(editedNotes));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (BuildContext context, AppointmentState apiState) {
        return BlocListener<AppointmentBloc, AppointmentState>(
          listener: (BuildContext context, AppointmentState apiListener) {
            if (apiListener is UpdateNotesInProgressAppointmentState) {
              _appointment = _appointment.rebuild(notes: apiListener.notes);
            }
            if (apiListener is CancelSuccessAppointmentState) {
              _appointment =
                  _appointment.rebuild(status: AppointmentStatus.canceled);
              setState(() => _isLoading = false);
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 302,
                    backgroundColor:
                        getIt.get<AppGlobals>().isPlatformBrightnessDark
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context).accentColor,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: AppointmentHeader(_appointment),
                    ),
                    title: _appointment != null
                        ? SliverAppTitle(child: Text(_appointment.code))
                        : Container(),
                  ),
                ];
              },
              body: LoadingOverlay(
                isLoading: _isLoading,
                child: ListView(
                  padding: const EdgeInsets.all(kPaddingM),
                  children: <Widget>[
                    AppointmentTabBar(
                      _appointment,
                      onCancelTap: cancelReservation,
                      onNotesTap: showNotesEditor,
                    ),
                    _serviceList(),
                    _totalPrice(),
                    const CardDivider(),
                    _footer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _serviceList() {
    if (_appointment == null || _appointment.services.isEmpty) {
      return Container();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: kPaddingM),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final ServiceModel item = _appointment.services[index];

        return ListItem(
          title: item.name,
          titleTextStyle: Theme.of(context).textTheme.subtitle1.w600,
          subtitle: (item.description.isNotEmpty) ? item.description : '',
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              StrutText(
                L10n.of(context).commonCurrencyFormat(
                    sprintf('%.2f', <double>[item.price])),
                style: Theme.of(context).textTheme.subtitle1.fs18.w500,
              ),
              StrutText(
                L10n.of(context).commonDurationFormat(item.duration.toString()),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .w300
                    .copyWith(color: Theme.of(context).hintColor),
              ),
            ],
          ),
          showBorder: false,
        );
      },
      itemCount: _appointment.services.length,
    );
  }

  Widget _totalPrice() {
    if (_appointment == null) {
      return Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: kPaddingM),
          child: StrutText(
            L10n.of(context).appointmentSubtitleTotal,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: kPaddingM),
          child: StrutText(
            L10n.of(context).commonCurrencyFormat(
                sprintf('%.2f', <double>[_appointment.totalPrice])),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }

  Widget _footer() {
    if (_appointment == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (_appointment.status == AppointmentStatus.active)
          ListTitle(title: L10n.of(context).appointmentSubtitleNotes),
        if (_appointment.notes.isNotEmpty) Text(_appointment.notes),
        if (_appointment.notes.isEmpty &&
            _appointment.status == AppointmentStatus.active)
          LinkButton(
            label: L10n.of(context).bookingAddNotes,
            onPressed: showNotesEditor,
          ),
        if (_appointment.status == AppointmentStatus.active)
          ListTitle(title: L10n.of(context).bookingSubtitleCancelationPolicy),
        if (_appointment.status == AppointmentStatus.active)
          Padding(
            padding: const EdgeInsets.only(bottom: kPaddingM),
            child: Text(_appointment.location.cancelationPolicy),
          ),
      ],
    );
  }
}
