import 'package:bloc_01/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDiviceFirstOpen() {
    return _prefs.getBool(AppConstants.DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null ? false : true;
  }
}
