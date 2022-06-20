import 'dart:convert';
import 'dart:io';

import 'package:SnipSnap/screens/AddBeautyExpert/Model/apiHelper.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/partnerUserModel.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/global.dart' as global;

class BusinessRule {
  APIHelper dbHelper;

  BusinessRule(APIHelper _dbHelper) {
    dbHelper = _dbHelper;
  }
  Future<bool> checkConnectivity() async {
    try {
      bool isConnected;
      var _connectivity = await (Connectivity().checkConnectivity());
      if (_connectivity == ConnectivityResult.mobile) {
        isConnected = true;
      } else if (_connectivity == ConnectivityResult.wifi) {
        isConnected = true;
      } else {
        isConnected = false;
      }

      if (isConnected) {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            isConnected = true;
          }
        } on SocketException catch (_) {
          isConnected = false;
        }
      }

      return isConnected;
    } catch (e) {
      print('Exception - businessRule.dart - checkConnectivity(): ' +
          e.toString());
    }
    return false;
  }

  Future<File> openCamera() async {
    try {
      PermissionStatus permissionStatus = await Permission.camera.status;
      if (permissionStatus.isLimited || permissionStatus.isDenied) {
        permissionStatus = await Permission.camera.request();
      }
      final PickedFile _selectedImage = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxHeight: 1000,
        maxWidth: 1200,
      );
      File imageFile = File(_selectedImage.path);
      if (imageFile != null) {
        File _byteData = await _cropImage(imageFile.path);
        _byteData = await _imageCompress(_byteData, imageFile.path);

        return _byteData;
      }
    } catch (e) {
      print("Exception - businessRule.dart - openCamera():" + e.toString());
    }
    return null;
  }

  Future<File> selectImageFromGallery() async {
    try {
      PermissionStatus permissionStatus = await Permission.photos.status;
      if (permissionStatus.isLimited || permissionStatus.isDenied) {
        permissionStatus = await Permission.photos.request();
      }
      File imageFile;
      final PickedFile _selectedImage = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxHeight: 1000,
        maxWidth: 1200,
      );
      imageFile = File(_selectedImage.path);
      if (imageFile != null) {
        File _byteData = await _cropImage(imageFile.path);
        _byteData = await _imageCompress(_byteData, imageFile.path);
        return _byteData;
      }
    } catch (e) {
      print("Exception - businessRule.dart - selectImageFromGallery()" +
          e.toString());
    }
    return null;
  }

  Future<File> _cropImage(String sourcePath) async {
    try {
      // File _croppedFile = await ImageCropper().cropImage(
      //   sourcePath: sourcePath,
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   androidUiSettings: AndroidUiSettings(
      //     initAspectRatio: CropAspectRatioPreset.original,
      //     backgroundColor: Colors.white,
      //     toolbarColor: Colors.black,
      //     dimmedLayerColor: Colors.white,
      //     toolbarWidgetColor: Colors.white,
      //     cropGridColor: Colors.white,
      //     activeControlsWidgetColor: Color(0xFF46A9FC),
      //     cropFrameColor: Color(0xFF46A9FC),
      //     lockAspectRatio: true,
      //   ),
      // );
      // if (_croppedFile != null) {
      //   return _croppedFile;
      // }
    } catch (e) {
      print("Exception - businessRule.dart - _cropImage():" + e.toString());
    }
    return null;
  }

  Future<File> _imageCompress(File file, String targetPath) async {
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        minHeight: 500,
        minWidth: 500,
        quality: 60,
      );

      return result;
    } catch (e) {
      print("Exception - businessRule.dart - _imageCompress():" + e.toString());
      return null;
    }
  }

  getSharedPreferences() async {
    try {
      global.sp = await SharedPreferences.getInstance();
    } catch (e) {
      print("Exception - businessRule.dart - getSharedPreferences():" +
          e.toString());
    }
  }

  saveUser(CurrentUser user) async {
    try {
      global.sp = await SharedPreferences.getInstance();
      await global.sp.setString('currentUser', json.encode(user.toJson()));
    } catch (e) {
      print("Exception - businessRule.dart - _saveUser():" + e.toString());
    }
  }
}
