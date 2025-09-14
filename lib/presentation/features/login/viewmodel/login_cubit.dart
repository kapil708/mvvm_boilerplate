import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:mvvm_boilerplate/data/sources/local/preferences_provider.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final APIRepository apiRepository;
  final PreferencesProvider preferencesProvider;

  LoginCubit({
    required this.apiRepository,
    required this.preferencesProvider,
  }) : super(LoginInitial());

  TextEditingController txtUsername = TextEditingController(text: 'emilys');
  TextEditingController txtPassword = TextEditingController(text: 'emilyspass');

  void login() async {
    try {
      emit(LoginLoading());

      var stringJson = jsonEncode({
        'username': txtUsername.text,
        'password': txtPassword.text,
      });

      var response = await apiRepository.login(stringJson);

      response.fold(
        (failure) => emit(LoginError(message: failure.message)),
        (data) {
          preferencesProvider.setAuthToken(data.accessToken);
          preferencesProvider.setRefreshToken(data.refreshToken);
          preferencesProvider.setUser(jsonEncode(data.toJson()));

          emit(LoginAuthorised());
        },
      );
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
