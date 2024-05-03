// ignore_for_file: always_declare_return_types

import 'package:shared_preferences/shared_preferences.dart';

class CashedHelper {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setUserToken(value) async {
    return await _sharedPreferences!.setString('access_token', value);
  }

  static String getUserToken() {
    return _sharedPreferences!.getString('access_token') ?? '';
  }

  static Future<bool> setUserId(value) async {
    return await _sharedPreferences!.setInt('user_id', value);
  }

  static int getUserId() {
    return _sharedPreferences!.getInt('user_id') ?? 0;
  }

  static Future<bool> setStatus(value) async {
    return await _sharedPreferences!.setInt('status', value);
  }

  static int getStatus() {
    return _sharedPreferences!.getInt('status') ?? 0;
  }

  static Future<bool> setLogin(value) async {
    return await _sharedPreferences!.setBool('login', value);
  }

  static Future<bool> setProductList(value) async {
    return await _sharedPreferences!.setStringList('Id', value);
  }

  static List getProductList() {
    return _sharedPreferences!.getStringList('Id') ?? [];
  }

  static bool getLogin() {
    return _sharedPreferences!.getBool('login') ?? false;
  }

  static Future<bool> setTotal(value) async {
    return await _sharedPreferences!.setDouble('total', value);
  }

  static double getTotal() {
    return _sharedPreferences!.getDouble('total') ?? 0;
  }

  static Future<bool> setFCMToken(value) async {
    return await _sharedPreferences!.setString('fcm_token', value);
  }

  static String getFCMToken() {
    return _sharedPreferences!.getString('fcm_token') ?? '';
  }

  static Future<bool> setPhone(value) async {
    return await _sharedPreferences!.setString('phone', value);
  }

  static String getPhone() {
    return _sharedPreferences!.getString('phone') ?? '';
  }

  static Future<bool> setEmail(value) async {
    return await _sharedPreferences!.setString('email', value);
  }

  static String getEmail() {
    return _sharedPreferences!.getString('email') ?? '';
  }

  static Future<bool> setAddress(value) async {
    return await _sharedPreferences!.setString('address', value);
  }

  static String getAddress() {
    return _sharedPreferences!.getString('address') ?? '';
  }

  static Future<bool> setPoints(value) async {
    return await _sharedPreferences!.setInt('points', value);
  }

  static int getPoints() {
    return _sharedPreferences?.getInt('points') ?? 0;
  }

  static Future<bool> setActive(value) async {
    return await _sharedPreferences!.setInt('active', value);
  }

  static int getActive() {
    return _sharedPreferences?.getInt('active') ?? 0;
  }

  static Future<bool> setLang(value) async {
    return await _sharedPreferences!.setString('lang', value);
  }

  static String getLang() {
    return _sharedPreferences!.getString('lang') ?? '';
  }

  static Future<bool> setUserImage(value) async {
    return await _sharedPreferences!.setString('image', value);
  }

  static String getUserImage() {
    return _sharedPreferences!.getString('image') ?? '';
  }

  static Future<bool> setUserName(value) async {
    return await _sharedPreferences!.setString('user_name', value);
  }

  static String getUserName() {
    return _sharedPreferences!.getString('user_name') ?? '';
  }

  static Future<bool> setHasPersonalReport(value) async {
    return await _sharedPreferences!.setBool('has_personal_report', value);
  }

  static bool getHasPersonalReport() {
    return _sharedPreferences!.getBool('has_personal_report') ?? false;
  }

  static Future<bool> setFullName(value) async {
    return await _sharedPreferences!.setString('first_name', value);
  }

  static String getFullName() {
    return _sharedPreferences!.getString('first_name') ?? '';
  }

  static Future<bool> setLastName(value) async {
    return await _sharedPreferences!.setString('last_name', value);
  }

  static String getLastName() {
    return _sharedPreferences!.getString('last_name') ?? '';
  }
}
