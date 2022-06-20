// import 'dart:io';

// import 'package:SnipSnap/generated/l10n.dart';
// import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
// import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
// // import 'package:SnipSnap/vendor/provider/local_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:SnipSnap/generated/l10n.dart';
// import 'package:provider/provider.dart';

// class ChooseLanguageScreen extends BaseRoute {
//   ChooseLanguageScreen({a, o}) : super(a: a, o: o, r: 'ChooseLanguageScreen');
//   @override
//   _ChooseLanguageScreenState createState() => new _ChooseLanguageScreenState();
// }

// class _ChooseLanguageScreenState extends BaseRouteState {
//   bool shopValue = false;
//   String onlineStatus;
//   bool isloading = true;

//   _ChooseLanguageScreenState() : super();

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context);
//     var locale = provider.locale ?? Locale('en');
//     return sc(
//       WillPopScope(
//         onWillPop: () {
//           Navigator.of(context).pop();
//           return null;
//         },
//         child: Scaffold(
//           body: Stack(
//             children: [
//               Container(
//                 height: 100,
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: ColorFiltered(
//                         colorFilter: ColorFilter.mode(
//                           Theme.of(context).primaryColor,
//                           BlendMode.screen,
//                         ),
//                         child: Image.asset(
//                           'assets/banner.jpg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Padding(
//                         padding: Platform.isAndroid
//                             ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
//                             : EdgeInsets.only(bottom: 15, left: 10, top: 20),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.keyboard_arrow_left_outlined,
//                               color: Colors.black,
//                             ),
//                             Text(
//                               L10n.of(context).lbl_back,
//                               style: TextStyle(
//                                   color: Colors.black, fontSize: 17.5),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                   ),
//                   margin: EdgeInsets.only(top: 80),
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 30, bottom: 10),
//                         child: Text(L10n.of(context).lbl_selet_language,
//                             style:
//                                 Theme.of(context).primaryTextTheme.headline3),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: L10n.languageListName.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return RadioListTile(
//                               activeColor: Theme.of(context).primaryColor,
//                               value: L10n.all[index].languageCode,
//                               groupValue: global.languageCode,
//                               onChanged: (val) {
//                                 final provider = Provider.of<LocaleProvider>(
//                                     context,
//                                     listen: false);
//                                 locale = Locale(val);
//                                 provider.setLocale(locale);
//                                 global.languageCode = locale.languageCode;
//                                 global.sp.setString(
//                                     'selectedLang', global.languageCode);

//                                 if (global.rtlLanguageCodeLList
//                                     .contains(locale.languageCode)) {
//                                   global.isRTL = true;
//                                 } else {
//                                   global.isRTL = false;
//                                 }
//                                 setState(() {});
//                               },
//                               title: Text(L10n.languageListName[index],
//                                   style: Theme.of(context)
//                                       .primaryTextTheme
//                                       .subtitle2),
//                             );
//                           },
//                         ),
//                       )
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }
// }
