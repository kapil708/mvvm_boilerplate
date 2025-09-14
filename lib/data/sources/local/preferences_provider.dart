import 'package:shared_preferences/shared_preferences.dart';

const _authToken = "authToken";
const _refreshToken = "refreshToken";
const _user = "user";
const _languagePrefs = "languagePrefs";
const _themePrefs = "themePrefs";

class PreferencesProvider {
  final SharedPreferences prefs;

  PreferencesProvider({required this.prefs});

  String? getAuthToken() => prefs.getString(_authToken);
  Future<bool> setAuthToken(String value) => prefs.setString(_authToken, value);
  Future<bool> removeAuthToken(String value) => prefs.remove(_authToken);

  String? getRefreshToken() => prefs.getString(_refreshToken);
  Future<bool> setRefreshToken(String value) => prefs.setString(_refreshToken, value);
  Future<bool> removeRefreshToken(String value) => prefs.remove(_refreshToken);

  String? getUser() => prefs.getString(_user);
  Future<bool> setUser(String value) => prefs.setString(_user, value);
  Future<bool> removeUser(String value) => prefs.remove(_user);

  String? getLanguage() => prefs.getString(_languagePrefs);
  Future<bool> setLanguage(String value) => prefs.setString(_languagePrefs, value);
  Future<bool> removeLanguage(String value) => prefs.remove(_languagePrefs);

  String? getTheme() => prefs.getString(_themePrefs);
  Future<bool> setTheme(String value) => prefs.setString(_themePrefs, value);
  Future<bool> removeTheme(String value) => prefs.remove(_themePrefs);

  clear() async => await prefs.clear();
}
