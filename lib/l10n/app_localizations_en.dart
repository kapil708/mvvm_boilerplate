// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loadingData => 'Loading Data';

  @override
  String get home => 'Home';

  @override
  String welcomeUser(String name) {
    return 'Welcome $name';
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
