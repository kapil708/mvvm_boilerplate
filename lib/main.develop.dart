import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm_boilerplate/di/service_locator.dart' as di;
import 'package:mvvm_boilerplate/presentation/app/view/my_app.dart';

void main() async {
  // Base setup
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Load environment values
  await dotenv.load(fileName: ".env.develop");

  // Dependency injection
  await di.setupLocator();

  runApp(MyApp());
}
