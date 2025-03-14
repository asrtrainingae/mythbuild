import "package:shared_preferences/shared_preferences.dart";
class SharedPreferenceHelper {

static getCustomerLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(customerLanguage) ?? 'en';
  }
  static setCustomerLanguage(String languageCode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(customerLanguage, languageCode);
  }

}

//keys
const String customerLanguage = 'en';