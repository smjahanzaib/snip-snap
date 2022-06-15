import 'package:SnipSnap/utils/console.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Providing a persistent store for simple data via [SharedPreferences].
///
/// Access to NSUserDefaults on iOS and SharedPreferences on Android.
class AppPreferences {
  static AppPreferences _instance;
  static SharedPreferences _preferences;

  static Future<AppPreferences> getInstance() async {
    _instance ??= AppPreferences();

    try {
      _preferences ??= await SharedPreferences.getInstance();
    } on Exception catch (e) {
      Console.log('EXCEPTION', e, error: e);
      // ignore: invalid_use_of_visible_for_testing_member
      // SharedPreferences.setMockInitialValues(<String, dynamic>{});
    }

    return _instance;
  }

  /// Reads a value from persistent storage as a String.
  String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  /// Saves a string [value] to persistent storage in the background.
  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  /// Saves a boolean [value] to persistent storage in the background.
  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  /// Returns true if persistent storage the contains the given [key].
  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// Removes an entry from persistent storage.
  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  /// Completes with true once the user preferences for the app has been cleared.
  Future<bool> clear() {
    return _preferences.clear();
  }
}
