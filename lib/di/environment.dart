import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // API
  static String get apiUrl => dotenv.get('API_URL');
  static String get baseUrl => dotenv.get('BASE_URL');
}
