import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/route/route_names.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/spacing.dart';
import 'package:mvvm_boilerplate/core/utils/ui_helper.dart';
import 'package:mvvm_boilerplate/core/utils/validators.dart';
import 'package:mvvm_boilerplate/presentation/common/custom_text_form_field.dart';
import 'package:mvvm_boilerplate/presentation/common/loading_widget.dart';
import 'package:mvvm_boilerplate/presentation/features/login/viewmodel/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();

    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginAuthorised) {
            context.goNamed(RouteName.home);
          } else if (state is LoginError) {
            showAlertDialog(context: context, body: state.message);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: loginCubit.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login", style: AppCss.h3),
                      const VSpace(16),
                      Text("Please enter your login details below", style: AppCss.bodySmall),
                      const VSpace(64),
                      CustomTextFormField(
                        controller: loginCubit.txtUsername,
                        labelText: "User Name",
                        validator: Validators.username,
                        textInputAction: TextInputAction.next,
                      ),
                      const VSpace(16),
                      CustomTextFormField(
                        controller: loginCubit.txtPassword,
                        labelText: "Password",
                        obscureText: true,
                        validator: Validators.password,
                        textInputAction: TextInputAction.done,
                      ),
                      const VSpace(32),
                      FilledButton(
                        style: FilledButton.styleFrom(minimumSize: Size.fromHeight(50)),
                        onPressed: () {
                          if (loginCubit.formKey.currentState?.validate() ?? false) {
                            loginCubit.login();
                          }
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is LoginLoading) LoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
