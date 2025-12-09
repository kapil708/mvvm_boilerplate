part of 'demo_cubit.dart';

sealed class DemoState extends Equatable {
  const DemoState();
}

final class DemoInitial extends DemoState {
  @override
  List<Object> get props => [];
}

final class DemoLoading extends DemoState {
  @override
  List<Object> get props => [];
}

final class DemoError extends DemoState {
  final String message;

  const DemoError({required this.message});

  @override
  List<Object> get props => [message];
}

final class DemoUpdate extends DemoState {
  final DateTime date;

  const DemoUpdate(this.date);

  @override
  List<Object> get props => [date];
}
