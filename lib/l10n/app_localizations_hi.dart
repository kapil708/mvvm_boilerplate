// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get loadingData => 'डेटा लोड हो रहा है';

  @override
  String get home => 'घर';

  @override
  String welcomeUser(String name) {
    return 'स्वागत है $name';
  }

  @override
  String stringWith1Param(String name) {
    return 'Here is 1st $name';
  }

  @override
  String stringWith2Param(String name, String name1) {
    return 'Here is 1st $name and here is 2nd $name1';
  }
}
