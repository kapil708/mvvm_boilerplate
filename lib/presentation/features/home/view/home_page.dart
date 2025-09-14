import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/route/route_names.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/ui_helper.dart';
import 'package:mvvm_boilerplate/presentation/features/home/viewmodel/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLogout) {
          context.goNamed(RouteName.login);
        } else if (state is HomeError) {
          showAlertDialog(context: context, body: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Welcome, ${homeCubit.user?.firstName}"),
            actions: [
              IconButton(
                onPressed: homeCubit.logOut,
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: homeCubit.products.length,
            itemBuilder: (context, index) {
              var product = homeCubit.products[index];

              return Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.title}", style: AppCss.bodySmall),
                      Text("${product.category}", style: AppCss.caption),
                      Text("${product.price}", style: AppCss.caption),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
