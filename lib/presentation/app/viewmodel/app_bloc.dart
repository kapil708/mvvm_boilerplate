import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/app_theme_mode.dart';
import '../../../core/enums/language.dart';
import '../../../data/sources/local/preferences_provider.dart';
import '../../../di/service_locator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<OnAppInit>(onAppInit);
    on<ChangeLanguage>(onChangeLanguage);
    on<ChangeThemeMode>(onChangeThemeMode);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<AppState> emit) async {
    await locator.get<PreferencesProvider>().setLanguage(event.selectedLanguage.value.languageCode);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onChangeThemeMode(ChangeThemeMode event, Emitter<AppState> emit) async {
    await locator.get<PreferencesProvider>().setTheme(event.selectedThemeMode.value.name);
    emit(state.copyWith(selectedThemeMode: event.selectedThemeMode));
  }

  onAppInit(OnAppInit event, Emitter<AppState> emit) async {
    final selectedLanguage = locator.get<PreferencesProvider>().getLanguage();
    final selectedThemeMode = locator.get<PreferencesProvider>().getTheme();

    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null ? Language.values.where((item) => item.value.languageCode == selectedLanguage).first : Language.english,
      selectedThemeMode: selectedThemeMode != null ? AppThemeMode.values.where((themeMode) => themeMode.value.name == selectedThemeMode).first : AppThemeMode.system,
    ));
  }
}
