import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm_boilerplate/core/utils/error_boundary.dart';
import 'package:mvvm_boilerplate/di/service_locator.dart' as di;
import 'package:mvvm_boilerplate/presentation/app/view/my_app.dart';

void main() async {
  // Base setup
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Initialize global error handling
  GlobalErrorHandler.initialize();

  // Load environment values
  await dotenv.load(fileName: ".env.develop");

  // Dependency injection
  await di.setupLocator();

  runApp(AppErrorBoundary(child: MyApp()));
}
