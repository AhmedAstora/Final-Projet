import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();

  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;

  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    log('hello');
  }

  bool getIsFirstTime() {
    bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  setIsFirstTimeValue() {
    sharedPreferences.setBool('isFirstTime', false);
  }

  setIsLoginFirstTimeValue() {
    sharedPreferences.setBool('isLoginFirstTime', false);
  }

  bool getIsLoginFirstTimeValue() {
    bool isFirstTimes = sharedPreferences.getBool('isLoginFirstTime')?? true;
    log(isFirstTimes.toString());
    return isFirstTimes;
  }

  setIsSellerTimeValue() {
    sharedPreferences.setBool('isSeller', false);

  }

  bool getIsSellerTimeValue() {
    bool isSeller = sharedPreferences.getBool('isSeller') ?? true;
    return isSeller;
  }

  saveMyName(String name) async {
    bool isSuccess = await sharedPreferences.setString('name', name);
    log(isSuccess.toString());
  }

  String getMyName() {
    return sharedPreferences.getString('name');
  }
}
