import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/route/app_router.dart';
import 'package:mvvm_boilerplate/core/theme/theme.dart';
import 'package:mvvm_boilerplate/core/theme/util.dart';
import 'package:mvvm_boilerplate/l10n/app_localizations.dart';
import 'package:mvvm_boilerplate/presentation/app/viewmodel/app_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Do not put AppRouter().router inside build method -> it will start the from initial route '/' on "Hot Reload"
  final GoRouter _router = AppRouter().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Theme and typo setup
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return BlocProvider<AppBloc>(
      create: (context) => AppBloc()..add(OnAppInit()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Food Ai",
            routerConfig: _router,

            /// Theming
            themeMode: state.selectedThemeMode.value,
            theme: theme.light(),
            darkTheme: theme.dark(),

            /// Localization
            locale: state.selectedLanguage.value,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
