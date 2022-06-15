import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/booking/booking_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/booking_wizard_page_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/booking/widgets/booking_step1.dart';
import 'package:SnipSnap/screens/booking/widgets/booking_step2.dart';
import 'package:SnipSnap/screens/booking/widgets/booking_step3.dart';
import 'package:SnipSnap/screens/booking/widgets/booking_step4.dart';
import 'package:SnipSnap/screens/booking/widgets/booking_success_dialog.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/full_screen_indicator.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/portrait_mode_mixin.dart';
import 'package:SnipSnap/widgets/sliver_app_title.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:sprintf/sprintf.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key key,
    this.params,
  }) : super(key: key);

  final Map<String, dynamic> params;

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with PortraitStatefulModeMixin<BookingScreen> {
  final int totalSteps = 4;

  int _locationId = 0;
  int _currentStep = 1;

  ServiceModel _preselectedService;

  BookingSessionModel session;

  List<BookingWizardPageModel> wizardPages = <BookingWizardPageModel>[];

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _locationId = widget.params['locationId'] as int ?? 0;
    _preselectedService = widget.params['preselectedService'] as ServiceModel;

    BlocProvider.of<BookingBloc>(context)
        .add(LocationLoadedBookingEvent(locationId: _locationId));

    wizardPages.add(BookingWizardPageModel.fromJson(<String, dynamic>{
      'step': 1,
      'body': BookingStep1(preselectedService: _preselectedService),
    }));
    wizardPages.add(BookingWizardPageModel.fromJson(<String, dynamic>{
      'step': 2,
      'body': BookingStep2(),
    }));
    wizardPages.add(BookingWizardPageModel.fromJson(<String, dynamic>{
      'step': 3,
      'body': BookingStep3(),
    }));
    wizardPages.add(BookingWizardPageModel.fromJson(<String, dynamic>{
      'step': 4,
      'body': BookingStep4(),
    }));
  }

  void _nextStep() {
    if (_currentStep == 1) {
      if (session.selectedServiceIds == null ||
          session.selectedServiceIds.isEmpty) {
        UI.showErrorDialog(
          context,
          message: L10n.of(context).bookingWarningServices,
        );

        return;
      }
    } else if (_currentStep == 3) {
      if (session.selectedTimestamp == 0) {
        UI.showErrorDialog(
          context,
          message: L10n.of(context).bookingWarningAppointment,
        );

        return;
      }
    } else if (_currentStep == 4) {
      BlocProvider.of<BookingBloc>(context).add(SubmittedBookingEvent());
    }

    if (_currentStep < totalSteps) {
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<BookingBloc, BookingState>(
      builder: (BuildContext context, BookingState state) {
        if (state is! SessionRefreshSuccessBookingState) {
          /// Show the full screen indicator until we return here.
          return FullScreenIndicator(
            color: Theme.of(context).cardColor,
            backgroundColor: Theme.of(context).cardColor,
          );
        }

        session = (state as SessionRefreshSuccessBookingState).session;

        if (session.appointmentId > 0) {
          return BookingSuccessDialog();
        }

        return BlocListener<BookingBloc, BookingState>(
          listener: (BuildContext context, BookingState listener) {
            if (listener is StaffSelectionSuccessBookingState) {
              _nextStep();
            } else if (listener is SessionRefreshSuccessBookingState) {
              if (listener.session.apiError.isNotEmpty) {
                UI.showErrorDialog(context, message: listener.session.apiError);
              }
            }
          },
          child: Scaffold(
            body: LoadingOverlay(
              isLoading: session.isSubmitting,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false, //no back button
                          pinned: true,
                          leading: Visibility(
                            visible: _currentStep > 1,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              tooltip: L10n.of(context).commonTooltipInfo,
                              onPressed: _previousStep,
                            ),
                          ),
                          actions: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.close),
                              tooltip: L10n.of(context).commonTooltipInfo,
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                          expandedHeight: 150.0,
                          title: SliverAppTitle(
                            child: Text(
                              sprintf('%d/%d: %s', <dynamic>[
                                _currentStep,
                                totalSteps,
                                L10n.of(context).bookingTitleWizardPage(
                                    'page' + _currentStep.toString())
                              ]),
                            ),
                          ),
                          centerTitle: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              padding: const EdgeInsets.only(
                                  left: kPaddingM,
                                  bottom: kPaddingM,
                                  right: kPaddingM),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  StrutText(
                                    L10n.of(context).bookingLabelSteps(
                                        _currentStep, totalSteps),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(color: Colors.white70),
                                    maxLines: 1,
                                  ),
                                  StrutText(
                                    L10n.of(context).bookingTitleWizardPage(
                                        'page' + _currentStep.toString()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .white
                                        .w600,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverFillRemaining(
                          hasScrollBody: true,
                          child: IndexedStack(
                            index: _currentStep - 1,
                            children: List<Widget>.generate(wizardPages.length,
                                (int index) => wizardPages[index].body),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _bottomBar(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _bottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            width: 2,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      padding: const EdgeInsets.all(kPaddingM),
      child: SafeArea(
        top: false,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    StrutText(
                      sprintf('%.2f', <double>[session.totalPrice]),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .bold
                          .copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText2.color),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: StrutText(
                        kCurrency,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .w400
                            .copyWith(
                                color:
                                    Theme.of(context).textTheme.caption.color),
                      ),
                    ),
                  ]),
                  Row(
                    children: <Widget>[
                      StrutText(
                        session.totalDuration.toString(),
                        style: Theme.of(context).textTheme.headline5.w500,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: StrutText(
                          L10n.of(context).bookingMinutes,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .w400
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .color),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ThemeButton(
              text: _currentStep == totalSteps
                  ? L10n.of(context).bookingBtnConfirm
                  : L10n.of(context).bookingBtnNext,
              onPressed: _nextStep,
              disableTouchWhenLoading: true,
              showLoading: session.isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}
