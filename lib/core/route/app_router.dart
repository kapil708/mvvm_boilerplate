import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/route/route_names.dart';
import 'package:mvvm_boilerplate/di/service_locator.dart';
import 'package:mvvm_boilerplate/presentation/features/home/view/home_page.dart';
import 'package:mvvm_boilerplate/presentation/features/home/viewmodel/home_cubit.dart';
import 'package:mvvm_boilerplate/presentation/features/login/view/login_page.dart';
import 'package:mvvm_boilerplate/presentation/features/login/viewmodel/login_cubit.dart';
import 'package:mvvm_boilerplate/presentation/features/splash/view/splash_page.dart';
import 'package:mvvm_boilerplate/presentation/features/splash/viewmodel/splash_cubit.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    redirect: (context, state) => null,
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.splash,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<SplashCubit>()..init(),
          child: const SplashPage(),
        ),
      ),

      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),

      GoRoute(
        path: '/home',
        name: RouteName.home,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<HomeCubit>()..init(),
          child: const HomePage(),
        ),
      ),

      // GoRoute(
      //   path: '/home',
      //   name: RouteName.home,
      //   builder: (context, state) => BlocProvider(create: (context) => locator.get<HomeCubit>(), child: const HomePage()),
      //   routes: [
      //     GoRoute(
      //       path: 'foodDetail',
      //       name: RouteName.foodDetail,
      //       builder: (context, state) {
      //         List<dynamic> filePaths = [];
      //         if (state.uri.queryParameters['filePaths'] != null) {
      //           filePaths = jsonDecode(state.uri.queryParameters['filePaths']!);
      //         }
      //
      //         return BlocProvider(create: (context) => locator.get<FoodDetailCubit>()..init(filePaths), child: FoodDetailPage());
      //       },
      //     ),
      //   ],
      // ),
    ],
  );
}
