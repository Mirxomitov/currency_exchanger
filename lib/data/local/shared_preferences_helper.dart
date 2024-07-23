import 'package:currency_exchanger/utils/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late final SharedPreferences _prefs;
  static const String _keyLanguage = 'language';
  static const String _keyColorIndex = 'color_index';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setColorIndex(int index) async {
    await _prefs.setInt(_keyColorIndex, index);
  }

  static int getColorIndex() {
    return _prefs.getInt(_keyColorIndex) ?? 0;
  }

  static setLanguage(Language lang) {
    _prefs.setString(_keyLanguage, lang.languageText);
  }

  static Language getLanguage() {
    final lang = _prefs.getString(_keyLanguage);

    if (lang == Language.uzbekKirill.languageText) {
      return Language.uzbekKirill;
    } else if (lang == Language.uzbekLatin.languageText) {
      return Language.uzbekLatin;
    } else if (lang == Language.english.languageText) {
      return Language.english;
    } else {
      return Language.russian;
    }
  }
}
