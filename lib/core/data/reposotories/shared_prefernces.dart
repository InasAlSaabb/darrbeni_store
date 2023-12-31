import 'dart:convert';

import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/data/models/cart_model.dart';
import 'package:flutter_templete/core/enums/data_type.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class SharedPreferencesRepository {
  SharedPreferences globalSharedPreferences = Get.find();
  //!--- Keys ----
  String PREF_FIRST_LAUNCH = 'first_launch';
  String PREF_TOKEN = 'token';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_ORDER_PLACED = 'order_placed';
  String PREF_EMAIL_RESET_PASSWORD = 'email_reset_password';
  String PREF_SUB_STATUS = 'sub_status';
  //  String PREF_ISLOGGED = 'is_logged';

  void setFirstLaunch(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LAUNCH,
      value: value,
    );
  }

  bool getFirstLaunch() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LAUNCH)) {
      return getPreference(key: PREF_FIRST_LAUNCH);
    } else {
      return true;
    }
  }

  void setOrderPlaced(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_ORDER_PLACED,
      value: value,
    );
  }

  bool getOrderPlaced() {
    if (globalSharedPreferences.containsKey(PREF_ORDER_PLACED)) {
      return getPreference(key: PREF_ORDER_PLACED);
    } else {
      return true;
    }
  }

  void setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPreferences.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(jsonDecode(getPreference(key: PREF_TOKEN)));
    } else {
      return null;
    }
  }

  void clearTokenInfo() {
    // globalSharedPreferences.remove(PREF_TOKEN);
    globalSharedPreferences.clear();
  }

  void setCartList(List<CartModel> list) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_CART_LIST,
      value: CartModel.encode(list),
    );
  }

  List<CartModel> getCartList() {
    if (globalSharedPreferences.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  bool get isLoggedIn => getTokenInfo() != null ? true : false;

  void setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPreference!.containsKey(PREF_APP_LANG)) {
      return getPreference(key: PREF_APP_LANG);
    } else {
      return AppConfig.defaultLanguage;
    }
  }

  void setResetPasswordEmail(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_EMAIL_RESET_PASSWORD,
      value: value,
    );
  }

  String getResetPasswordEmail() {
    if (globalSharedPreferences.containsKey(PREF_EMAIL_RESET_PASSWORD)) {
      return getPreference(key: PREF_EMAIL_RESET_PASSWORD);
    } else {
      return '';
    }
  }

  void clearResetPasswordEmail() {
    globalSharedPreferences.remove(PREF_EMAIL_RESET_PASSWORD);
    // globalSharedPreferences.clear();
  }

  void setSubStatus(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (globalSharedPreferences.containsKey(PREF_SUB_STATUS)) {
      return getPreference(key: PREF_SUB_STATUS);
    } else {
      return AppConfig.scriptionStatus;
    }
  }

  //  void setFirstLogin(bool value) {
  //   setPreference(
  //     dataType: DataType.BOOL,
  //     key: PREF_ISLOGGED,
  //     value: value,
  //   );
  // }

  //  bool getFirstLogin() {
  //   if (globalSharedPreferences.containsKey(PREF_ISLOGGED)) {
  //     return getPreference(key: PREF_ISLOGGED);
  //   } else {
  //     return true;
  //   }
  // }

  //!--- Main Function ----
  setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}
