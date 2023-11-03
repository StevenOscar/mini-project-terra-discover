import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveCurrencies ({
    required int orundumValue,
    required int originiumValue,
    required int oneHeadhuntingValue,
    required int tenHeadhuntingValue
  }) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setInt("orundum", orundumValue);
    sharedPref.setInt("originium", originiumValue);
    sharedPref.setInt("1x headhunting", oneHeadhuntingValue);
    sharedPref.setInt("10x headhunting", tenHeadhuntingValue);
  }

  Future<Map<String, int>> getCurrencies () async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    Map<String, int> currenciesMap = {};

    currenciesMap["orundum"] = sharedPref.getInt("orundum") ?? 0;
    currenciesMap["originium"] = sharedPref.getInt("originium") ?? 0;
    currenciesMap["1x headhunting"] = sharedPref.getInt("1x headhunting") ?? 0;
    currenciesMap["10x headhunting"] = sharedPref.getInt("10x headhunting") ?? 0;

    return currenciesMap;
  }
}