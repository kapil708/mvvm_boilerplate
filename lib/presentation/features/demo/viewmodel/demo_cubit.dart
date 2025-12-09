import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_boilerplate/data/repositories/api_repository.dart';

part 'demo_state.dart';

class DemoCubit extends Cubit<DemoState> {
  final APIRepository apiRepository;

  DemoCubit({required this.apiRepository}) : super(DemoInitial());

  void init() async {
    try {
      // Code here
    } catch (e) {
      // error handling
    }
  }
}
