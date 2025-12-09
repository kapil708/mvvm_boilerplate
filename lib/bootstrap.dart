import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm_boilerplate/di/service_locator.dart' as di;
import 'package:mvvm_boilerplate/presentation/app/view/my_app.dart';

Future<void> bootstrap({required String envFile}) async {
  // Base setup
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Load environment values
  await dotenv.load(fileName: envFile);

  // Dependency injection
  await di.setupLocator();

  runApp(MyApp());
}
