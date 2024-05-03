import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class _CacheConstants {
  static const String user = 'user';
  static const String locale = 'lang';
}

class PrefsService {
  static late final SharedPreferences _self;

  Future<void> init() async {
    _self = await SharedPreferences.getInstance();
  }

  final user = const UserCache();
  final locale = const LocaleCache();
}

class UserCache extends _CacheField<Map<String, dynamic>> {
  const UserCache() : super(_CacheConstants.user);
}

class LocaleCache extends _CacheField<String> {
  const LocaleCache() : super(_CacheConstants.locale);

  @override
  String get() {
    return super.get() ?? 'ar';
  }
}

class _CacheField<T> {
  final String key;

  const _CacheField(this.key);

  Future<bool> put(T value) {
    return PrefsService._self.setString(key, jsonEncode(value));
  }

  T? get() {
    try {
      return jsonDecode(PrefsService._self.getString(key)!);
    } catch (e) {
      return null;
    }
  }

  Future<bool> delete() {
    return PrefsService._self.remove(key);
  }

  bool exists() {
    return PrefsService._self.containsKey(key);
  }
}
