import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/list.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/initials_circle_avatar.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';

class LocationStaff extends StatelessWidget {
  const LocationStaff({
    Key key,
    this.location,
    this.limit = 5,
  }) : super(key: key);

  final LocationModel location;
  final int limit;

  @override
  Widget build(BuildContext context) {
    if (location == null || location.staff.isNullOrEmpty) {
      return Container();
    }

    List<StaffModel> _staff;

    if (limit >= location.staff.length) {
      _staff = location.staff;
    } else {
      _staff = location.staff.sublist(0, limit);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UppercaseTitle(
          title: L10n.of(context).locationTitleStaff,
          padding: const EdgeInsetsDirectional.only(
              top: kPaddingL, start: kPaddingM),
        ),
        Container(
          height: 160,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.only(
                top: kPaddingM, start: kPaddingM),
            children: _staff.map((StaffModel staff) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, Routes.booking,
                          arguments: <String, dynamic>{
                            'locationId': location.id,
                            'preselectedStaff': staff.id
                          }),
                      child: staff.profilePhoto.isEmpty
                          ? InitialsCircleAvatar(
                              initials: staff.name.initials,
                              size: InitialsCircleAvatarSize.large)
                          : CircleAvatar(
                              radius: 48,
                              backgroundImage: AssetImage(staff.profilePhoto),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: kPaddingS),
                      child: StrutText(
                        staff.name,
                        style: Theme.of(context).textTheme.subtitle1.w600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
