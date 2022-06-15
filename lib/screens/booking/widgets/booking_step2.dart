import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/booking/booking_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/arrow_right_icon.dart';
import 'package:SnipSnap/widgets/initials_circle_avatar.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class BookingStep2 extends StatefulWidget {
  @override
  _BookingStep2State createState() => _BookingStep2State();
}

class _BookingStep2State extends State<BookingStep2> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (BuildContext context, BookingState state) {
        final BookingSessionModel session =
            (state as SessionRefreshSuccessBookingState).session;

        final List<ListItem> _listItems = <ListItem>[];

        _listItems.add(_staffItem(
            StaffModel.fromJson(<String, dynamic>{
              'id': 0,
              'name': L10n.of(context).bookingStaffNoPreferenceName,
              'description':
                  L10n.of(context).bookingStaffNoPreferenceDescription,
              'profile_photo': 'np.png',
            }),
            session));
        for (int i = 0; i < session.location.staff.length; i++) {
          _listItems.add(_staffItem(session.location.staff[i], session));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _listItems,
            ),
          ),
        );
      },
    );
  }

  ListItem _staffItem(StaffModel staffModel, BookingSessionModel session) {
    return ListItem(
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: kPaddingS),
        child: staffModel.profilePhoto.isEmpty
            ? InitialsCircleAvatar(initials: staffModel.name.initials)
            : CircleAvatar(
                radius: kCircleAvatarSizeRadiusSmall,
                backgroundImage: AssetImage(staffModel.profilePhoto),
              ),
      ),
      title: staffModel.name,
      titleTextStyle: Theme.of(context).textTheme.subtitle1.fs18.w500,
      trailing: Row(
        children: <Widget>[
          if (staffModel.rate > 0)
            StrutText(
              staffModel.rate.toString(),
              style: Theme.of(context).textTheme.subtitle1.fs18.bold,
            ),
          if (staffModel.rate > 0)
            const Icon(
              Icons.star,
              size: 20,
              color: kPrimaryColor,
            ),
          const ArrowRightIcon(),
        ],
      ),
      subtitle: staffModel.description,
      subtitleTextStyle: Theme.of(context)
          .textTheme
          .bodyText1
          .w300
          .copyWith(color: Theme.of(context).hintColor),
      onPressed: () {
        setState(() => context
            .read<BookingBloc>()
            .add(StaffSelectedBookingEvent(staff: staffModel)));
      },
    );
  }
}
