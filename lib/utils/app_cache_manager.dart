import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Our custom cache manager used for [CachedNetworkImage].
///
/// Can be used as inspiration for more complex cache managers.
class AppCacheManager extends CacheManager {
  factory AppCacheManager() {
    _instance ??= AppCacheManager._();
    return _instance;
  }

  /// Init class by setting stale period to 7 days (instead of 30 by default).
  AppCacheManager._() : super(Config(key, stalePeriod: const Duration(days: 7)));

  static const String key = 'appCache';

  static AppCacheManager _instance;
}
