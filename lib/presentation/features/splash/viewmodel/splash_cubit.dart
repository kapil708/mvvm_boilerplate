import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_boilerplate/data/sources/local/preferences_provider.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final PreferencesProvider preferencesProvider;

  SplashCubit({required this.preferencesProvider}) : super(SplashInitial());

  void init() async {
    await Future.delayed(Duration(seconds: 2));

    var authToken = preferencesProvider.getAuthToken();
    if (authToken != null && authToken.isNotEmpty) {
      emit(SplashAuthorised());
    } else {
      emit(SplashUnAuthorised());
    }
  }
}
