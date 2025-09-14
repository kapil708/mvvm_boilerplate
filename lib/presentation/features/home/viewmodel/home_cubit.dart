import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_boilerplate/data/models/product/product.dart';
import 'package:mvvm_boilerplate/data/models/user/user.dart';
import 'package:mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:mvvm_boilerplate/data/sources/local/preferences_provider.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final APIRepository apiRepository;
  final PreferencesProvider preferencesProvider;

  HomeCubit({
    required this.preferencesProvider,
    required this.apiRepository,
  }) : super(HomeInitial());

  User? user;
  List<Product> products = [];

  void init() async {
    var userData = preferencesProvider.getUser();
    if (userData != null && userData.isNotEmpty) {
      user = User.fromJson(jsonDecode(userData));
      emit(HomeUpdate(DateTime.now()));
      loadProducts();
    } else {
      logOut();
    }
  }

  void logOut() async {
    await preferencesProvider.clear();
    emit(HomeLogout());
  }

  void loadProducts() async {
    try {
      emit(HomeLoading());

      var response = await apiRepository.products();
      response.fold(
        (failure) => emit(HomeError(message: failure.message)),
        (data) {
          products = data;
          emit(HomeUpdate(DateTime.now()));
        },
      );
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
