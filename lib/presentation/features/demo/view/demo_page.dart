import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_boilerplate/presentation/features/demo/viewmodel/demo_cubit.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    DemoCubit demoCubit = context.read<DemoCubit>();

    return BlocConsumer<DemoCubit, DemoState>(
      listener: (context, state) {
        if (state is DemoError) {
          // error handling
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Demo")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // widgets here
            ],
          ),
        );
      },
    );
  }
}
