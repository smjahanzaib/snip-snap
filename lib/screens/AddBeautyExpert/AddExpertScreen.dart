// ignore_for_file: directives_ordering

import 'dart:io';
import 'dart:ui';

import 'package:SnipSnap/screens/AddBeautyExpert/Dialog/saveDialog.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/baseRoute.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/expertModel.dart';

import 'package:SnipSnap/screens/AddBeautyExpert/Model/global.dart' as global;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpertScreen extends BaseRoute {
  final Expert experts;
  AddExpertScreen({a, o, this.experts})
      : super(a: a, o: o, r: 'AddExpertScreen');
  @override
  _AddExpertScreenState createState() =>
      new _AddExpertScreenState(this.experts);
}

class _AddExpertScreenState extends BaseRouteState {
  Expert experts = new Expert();
  TextEditingController _cStaffName = new TextEditingController();
  TextEditingController _cStaffDescription = new TextEditingController();
  bool _showConfirmPassword = false;
  GlobalKey<ScaffoldState> _scaffoldKey;
  File _tImage;

  var _fEmail = FocusNode();
  var _fPassword = FocusNode();
  Expert _experts = new Expert();
  var dropdownval;
  _AddExpertScreenState(this.experts) : super();

  @override
  Widget build(BuildContext context) {
    return sc(
      WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _addExperts();
                },
                child: Text(
                  "save expert",
                ),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            resizeToAvoidBottomInset: false,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor,
                              BlendMode.screen,
                            ),
                            child: Image.asset(
                              'assets/banner.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: Platform.isAndroid
                              ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
                              : EdgeInsets.only(bottom: 15, left: 10, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  'back',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(top: 80),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                child: Text(
                                  experts != null
                                      ? "edit expert"
                                      : "add Expert",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                )),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "expert name",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          textCapitalization:
                                              TextCapitalization.words,
                                          controller: _cStaffName,
                                          focusNode: _fEmail,
                                          onFieldSubmitted: (val) {
                                            FocusScope.of(context)
                                                .requestFocus(_fPassword);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "expert name",
                                            contentPadding: EdgeInsets.only(
                                                top: 5, left: 10, right: 10),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "description",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          controller: _cStaffDescription,
                                          maxLines: 5,
                                          obscureText: _showConfirmPassword,
                                          decoration: InputDecoration(
                                            hintText: "description",
                                            contentPadding: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "upload image",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        margin: EdgeInsets.only(top: 5),
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _tImage == null
                                            ? experts == null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      _showCupertinoModalSheet();
                                                      setState(() {});
                                                    },
                                                    child: Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.image,
                                                          size: 55,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryTextTheme
                                                              .headline1
                                                              .color,
                                                        ),
                                                        Text("tap to add image")
                                                      ],
                                                    )),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      _showCupertinoModalSheet();
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: CachedNetworkImage(
                                                        imageUrl: global
                                                                .baseUrlForImage +
                                                            experts.staff_image,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          height: 90,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  image:
                                                                      imageProvider)),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  )
                                            : GestureDetector(
                                                onTap: () {
                                                  _showCupertinoModalSheet();
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                _tImage),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {
    try {
      if (experts != null) {
        if (experts.staff_id != null) {
          _cStaffName.text = experts.staff_name;
          _cStaffDescription.text = experts.staff_description;
          _experts.staff_id = experts.staff_id;
        }
      }
    } catch (e) {
      print("Exception - addExpertScreen.dart - init():" + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  _addExperts() async {
    try {
      _experts.vendor_id = global.user.id;
      _experts.staff_name = _cStaffName.text.trim();
      _experts.staff_description = _cStaffDescription.text.trim();

      if (_cStaffName.text.isNotEmpty && _cStaffDescription.text.isNotEmpty) {
        bool isConnected = await br.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();

          if (_experts.staff_id == null) {
            if (_tImage != null) {
              await apiHelper
                  .addExpert(_experts.vendor_id, _experts.staff_name,
                      _experts.staff_description, _tImage)
                  .then((result) {
                if (result.status == "1") {
                  hideLoader();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SaveExpertDialog(
                            a: widget.analytics,
                            o: widget.observer,
                          ));
                } else {
                  hideLoader();
                  showSnackBar(
                      key: _scaffoldKey, snackBarMessage: '${result.message}');
                }
              });
            } else {
              hideLoader();
              showSnackBar(
                  key: _scaffoldKey, snackBarMessage: "please select image");
            }
          } else //update
          {
            await apiHelper
                .editExpert(_experts.vendor_id, _experts.staff_name,
                    _experts.staff_description, _tImage, _experts.staff_id)
                .then((result) {
              if (result.status == "1") {
                hideLoader();
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SaveExpertDialog(
                          a: widget.analytics,
                          o: widget.observer,
                        ));
              } else {
                hideLoader();
                showSnackBar(
                    key: _scaffoldKey, snackBarMessage: '${result.message}');
              }
            });
          }
        } else {
          showNetworkErrorSnackBar(_scaffoldKey);
        }
      } else if (_cStaffName.text.isEmpty) {
        showSnackBar(key: _scaffoldKey, snackBarMessage: "please enter name");
      } else if (_cStaffDescription.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey, snackBarMessage: "please enter description");
      }
    } catch (e) {
      print("Exception - addExpertScreen.dart - addExpert():" + e.toString());
    }
  }

  _showCupertinoModalSheet() {
    try {
      FocusScope.of(context).unfocus();

      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text("action"),
          actions: [
            CupertinoActionSheetAction(
              child: Text("take picture",
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.openCamera();
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text("choose from library",
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.selectImageFromGallery();
                hideLoader();
                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text("cancel", style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - addExpertScreen.dart - _showCupertinoModalSheet():" +
          e.toString());
    }
  }
}
