import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/blocs/booking/booking_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/service_group_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/widgets/arrow_right_icon.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/list_title.dart';
import 'package:SnipSnap/widgets/sign_in.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/text_style.dart';

class BookingStep4 extends StatefulWidget {
  @override
  _BookingStep4State createState() => _BookingStep4State();
}

class _BookingStep4State extends State<BookingStep4> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return getIt.get<AppGlobals>().user == null
            ? SignInWidget(title: L10n.of(context).bookingSubtitleSignin)
            : BlocBuilder<BookingBloc, BookingState>(
                buildWhen: (BookingState previous, BookingState current) {
                  // return true/false to determine whether or not
                  // to rebuild the widget with state
                  return current is SessionRefreshSuccessBookingState &&
                      current.session.totalPrice > 0;
                },
                builder: (BuildContext context, BookingState state) {
                  final BookingSessionModel session =
                      (state as SessionRefreshSuccessBookingState).session;

                  if (session.totalPrice == 0 || session.totalDuration == 0) {
                    return Container();
                  }

                  final List<ServiceModel> _selectedServices = <ServiceModel>[];

                  for (final ServiceGroupModel serviceGroupModel
                      in session.location.serviceGroups) {
                    for (final ServiceModel serviceModel
                        in serviceGroupModel.services) {
                      if (session.selectedServiceIds
                          .contains(serviceModel.id)) {
                        _selectedServices.add(serviceModel);
                      }
                    }
                  }

                  final DateTime startTime =
                      DateTime.fromMillisecondsSinceEpoch(
                          session.selectedTimestamp);
                  final DateTime endTime =
                      startTime.add(Duration(minutes: session.totalDuration));

                  return ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPaddingM),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //ListTitle(title: L10n.of(context).bookingSubtitleLocation),
                            ListItem(
                              title: session.location.name,
                              titleTextStyle:
                                  Theme.of(context).textTheme.headline6,
                              subtitle: sprintf('%s\n%s', <String>[
                                session.location.address,
                                session.location.city
                              ]),
                              leading: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    bottom: kPaddingM,
                                    top: kPaddingM,
                                    end: kPaddingS),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, Routes.location,
                                      arguments: session.location.id),
                                  child: Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(kFormFieldsRadius)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            session.location.mainPhoto),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              showBorder: false,
                            ),
                            ListTitle(
                                title: L10n.of(context)
                                    .bookingSubtitleAppointment),
                            ListItem(
                              title: startTime.toLocalDateTimeString,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .fs18
                                  .w600,
                              subtitle: sprintf('%s\n%s', <String>[
                                L10n.of(context).bookingTotalTime(
                                    startTime.toLocalTimeString,
                                    endTime.toLocalTimeString,
                                    L10n.of(context).commonDurationFormat(
                                        session.totalDuration)),
                                if (session.selectedStaff != null &&
                                    session.selectedStaff.id > 0)
                                  L10n.of(context).bookingWithStaff(
                                      session.selectedStaff.name.toUpperCase())
                                else
                                  '',
                              ]),
                              showBorder: false,
                            ),
                            //ListTitle(title: L10n.of(context).bookingSubtitleServices),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List<ListItem>.generate(
                                  _selectedServices.length, (int index) {
                                return ListItem(
                                  title: _selectedServices[index].name,
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .w600,
                                  subtitle: (_selectedServices[index]
                                          .description
                                          .isNotEmpty)
                                      ? _selectedServices[index].description
                                      : '',
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      StrutText(
                                        L10n.of(context).commonCurrencyFormat(
                                            sprintf('%.2f', <double>[
                                          _selectedServices[index].price
                                        ])),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .fs18
                                            .w500,
                                      ),
                                      StrutText(
                                        L10n.of(context).commonDurationFormat(
                                            _selectedServices[index]
                                                .duration
                                                .toString()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .w300
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .hintColor),
                                      ),
                                    ],
                                  ),
                                  showBorder: false,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        padding: const EdgeInsets.all(kPaddingM),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListItem(
                              title: L10n.of(context).bookingAddNotes,
                              subtitle: session.notes,
                              showBorder: false,
                              trailing: const ArrowRightIcon(),
                              onPressed: () => showNotesEditor(session.notes),
                            ),
                            ListTitle(
                                title:
                                    L10n.of(context).bookingSubtitleCheckout),
                            ListItem(
                              title: L10n.of(context).bookingPayWithCard,
                              showBorder: false,
                              leading: Radio<PaymentMethod>(
                                value: PaymentMethod.cc,
                                groupValue: session.paymentMethod,
                                onChanged: (PaymentMethod selected) =>
                                    selectPaymentmethodEvent(selected),
                              ),
                              onPressed: () =>
                                  selectPaymentmethodEvent(PaymentMethod.cc),
                            ),
                            ListItem(
                              title: L10n.of(context).bookingPayInStore,
                              showBorder: false,
                              leading: Radio<PaymentMethod>(
                                value: PaymentMethod.inStore,
                                groupValue: session.paymentMethod,
                                onChanged: (PaymentMethod selected) =>
                                    selectPaymentmethodEvent(selected),
                              ),
                              onPressed: () => selectPaymentmethodEvent(
                                  PaymentMethod.inStore),
                            ),
                            ListTitle(
                                title: L10n.of(context)
                                    .bookingSubtitleCancelationPolicy),
                            Padding(
                              padding: const EdgeInsets.only(bottom: kPaddingM),
                              child: Text(session.location.cancelationPolicy),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
      },
    );
  }

  void selectPaymentmethodEvent(PaymentMethod paymentMethod) {
    context
        .read<BookingBloc>()
        .add(PaymentMethodSelectedBookingEvent(paymentMethod));
  }

  Future<void> showNotesEditor(String notes) async {
    final String editedNotes = await Navigator.pushNamed(
        context, Routes.bookingNotes,
        arguments: notes);
    if (editedNotes != null) {
      BlocProvider.of<BookingBloc>(context)
          .add(NotesUpdatedBookingEvent(editedNotes));
    }
  }
}
