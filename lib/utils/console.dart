import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:SnipSnap/configs/constants.dart';

/// Console related functions like logging.
class Console {
  /// Log to console.
  static void log(String tag, dynamic msg, {Object error}) {
    // Application was compiled in debug mode?
    if (kDebugMode) {
      developer.log('$msg', time: DateTime.now(), name: tag, error: error);
    } else if (kLogzioToken.isNotEmpty) {
      if (error != null) {
        Logger(kAppVersion).severe('$msg');
      } else {
        Logger(kAppVersion).info('$msg');
      }
    }
  }
}
