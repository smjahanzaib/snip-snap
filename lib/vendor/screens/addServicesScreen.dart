import 'dart:io';
import 'dart:ui';

import 'package:SnipSnap/vendor/dialogs/saveServiceDialog.dart';
import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:SnipSnap/vendor/models/serviceModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class AddServiceScreen extends BaseRoute {
  final Service service;

  AddServiceScreen({a, o, this.service})
      : super(a: a, o: o, r: 'AddServiceScreen');
  @override
  _AddServiceScreenState createState() =>
      new _AddServiceScreenState(this.service);
}

class _AddServiceScreenState extends BaseRouteState {
  Service service = new Service();
  File _tImage;
  TextEditingController _cServiceName = new TextEditingController();
  Service _service = new Service();
  GlobalKey<ScaffoldState> _scaffoldKey;
  var dropdownval;

  _AddServiceScreenState(this.service) : super();

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
                  _addService();
                },
                child: Text(
                  L10n.of(context).btn_save_service,
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
                                  L10n.of(context).lbl_back,
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
                                  service != null
                                      ? L10n.of(context).lbl_edit_service
                                      : L10n.of(context).lbl_Add_service,
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
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          L10n.of(context).lbl_service_name,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          textCapitalization:
                                              TextCapitalization.words,
                                          controller: _cServiceName,
                                          decoration: InputDecoration(
                                            hintText: L10n.of(context)
                                                .hnt_service_name,
                                            contentPadding: EdgeInsets.only(
                                                top: 5, left: 10, right: 10),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          L10n.of(context).lbl_upload_image,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Theme.of(context)
                                                  .dividerColor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        margin: EdgeInsets.only(top: 5),
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _tImage == null
                                            ? service == null
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
                                                        Text(L10n.of(context)
                                                            .lbl_tap_to_add_image)
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
                                                            service
                                                                .service_image,
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

  @override
  void initState() {
    super.initState();
    _init();
  }

  _addService() async {
    try {
      _service.vendor_id = global.user.id;
      _service.service_name = _cServiceName.text.trim();

      if (_cServiceName.text.isNotEmpty) {
        bool isConnected = await br.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          if (_service.service_id == null) {
            if (_tImage != null) {
              await apiHelper
                  .addService(
                      _service.vendor_id, _service.service_name, _tImage)
                  .then((result) {
                if (result.status == "1") {
                  hideLoader();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SaveServiceDialog(
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
                  key: _scaffoldKey,
                  snackBarMessage: L10n.of(context).txt_please_select_image);
            }
          } else //update
          {
            await apiHelper
                .editService(_service.vendor_id, _service.service_name, _tImage,
                    _service.service_id)
                .then((result) {
              if (result.status == "1") {
                hideLoader();
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SaveServiceDialog(
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
      } else if (_cServiceName.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage: L10n.of(context).txt_please_enter_name);
      }
    } catch (e) {
      print(
          "Exception - addServicesScreen.dart - _addService():" + e.toString());
    }
  }

  _init() async {
    try {
      if (service != null) {
        if (service.service_id != null) {
          _cServiceName.text = service.service_name;
          _service.service_id = service.service_id;
        }
      }
    } catch (e) {
      print("Exception - addServiceScreen.dart - init():" + e.toString());
    }
  }

  _showCupertinoModalSheet() {
    try {
      FocusScope.of(context).unfocus();
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(L10n.of(context).lbl_action),
          actions: [
            CupertinoActionSheetAction(
              child: Text(L10n.of(context).lbl_take_picture,
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
              child: Text(L10n.of(context).lbl_choose_from_library,
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
            child: Text(L10n.of(context).lbl_cancel,
                style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - addServicesScreen.dart - _showCupertinoModalSheet():" +
          e.toString());
    }
  }
}
