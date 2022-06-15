import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/appointment/appointment_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/arrow_right_icon.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';
import 'package:sprintf/sprintf.dart';
import 'package:SnipSnap/utils/text_style.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    Key key,
    @required this.appointment,
  }) : super(key: key);

  final AppointmentModel appointment;

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  double _rate = 0;
  int _charsRemaining = 400;
  bool _showLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        return BlocListener<AppointmentBloc, AppointmentState>(
          listener: (BuildContext context, AppointmentState state) {
            if (state is ReviewSuccessAppointmentState) {
              Navigator.pushNamed(context, Routes.appointmentRatingSuccess);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(L10n.of(context).reviewTitle),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ListItem(
                            title: widget.appointment.location.name,
                            titleTextStyle:
                                Theme.of(context).textTheme.headline6,
                            subtitle: sprintf('%s\n%s', <String>[
                              widget.appointment.location.address,
                              widget.appointment.location.city
                            ]),
                            leading: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: kPaddingM,
                                  top: kPaddingM,
                                  end: kPaddingS),
                              child: Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(kFormFieldsRadius)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.appointment.location.mainPhoto),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            trailing: const ArrowRightIcon(),
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.location,
                                arguments: widget.appointment.location.id),
                          ),
                          UppercaseTitle(
                              title: L10n.of(context).reviewLabelRate),
                          Padding(
                            padding: const EdgeInsets.only(top: kPaddingS),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: kPaddingS),
                                  child: StarRating(
                                    rating: _rate,
                                    size: 44,
                                    onRatingChanged: (double rating) =>
                                        setState(() => _rate = rating),
                                  ),
                                ),
                                Expanded(
                                  child: StrutText(
                                    sprintf('%.1f', <double>[_rate]),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .bold
                                        .copyWith(color: kPrimaryColor),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          UppercaseTitle(
                              title: L10n.of(context).reviewLabelComment),
                          Padding(
                            padding: const EdgeInsets.only(top: kPaddingS),
                            child: ThemeTextInput(
                              hintText:
                                  L10n.of(context).reviewCommentPlaceholder,
                              focusNode: focusNode,
                              textInputAction: TextInputAction.next,
                              maxLines: 5,
                              controller: textEditingController,
                              lengthLimit: kReviewLengthLimit,
                              onChanged: (String value) => setState(() =>
                                  _charsRemaining =
                                      kReviewLengthLimit - value.length),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: kPaddingS),
                            child: Text(
                              L10n.of(context)
                                  .reviewLengthLimit(_charsRemaining),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: kPaddingS),
                      child: ThemeButton(
                        onPressed: () {
                          if (_rate == 0) {
                            UI.showMessage(
                              context,
                              message: L10n.of(context).reviewWarning,
                              buttonText: L10n.of(context).commonBtnOk,
                            );
                          } else {
                            setState(() => _showLoading = true);

                            BlocProvider.of<AppointmentBloc>(context)
                                .add(ReviewedAppointmentEvent());
                          }
                        },
                        text: L10n.of(context).reviewSubmitBtn,
                        showLoading: _showLoading,
                        disableTouchWhenLoading: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
