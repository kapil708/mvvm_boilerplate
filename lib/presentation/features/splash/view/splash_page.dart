import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/assets/image_assets.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/spacing.dart';

import '../../../../core/route/route_names.dart';
import '../viewmodel/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthorised) {
          context.goNamed(RouteName.home);
        } else if (state is SplashUnAuthorised) {
          context.goNamed(RouteName.login);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo, width: MediaQuery.sizeOf(context).width * 0.4),
              VSpace(32),
              Text("App Title", style: AppCss.h3),
              VSpace(16),
              Text("App Tagline", style: AppCss.bodyBase),
            ],
          ),
        ),
      ),
    );
  }
}
