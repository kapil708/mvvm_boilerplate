part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashAuthorised extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashUnAuthorised extends SplashState {
  @override
  List<Object> get props => [];
}
