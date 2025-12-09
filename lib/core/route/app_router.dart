import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_boilerplate/core/enums/route_names.dart';
import 'package:mvvm_boilerplate/di/service_locator.dart';
import 'package:mvvm_boilerplate/presentation/features/demo/view/demo_page.dart';
import 'package:mvvm_boilerplate/presentation/features/demo/viewmodel/demo_cubit.dart';

//list of items
import 'import_list.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    redirect: (context, state) => null,
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.splash.name,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<SplashCubit>()..init(),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: RouteName.login.name,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/home',
        name: RouteName.home.name,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<HomeCubit>()..init(),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: '/demo',
        name: RouteName.demo.name,
        builder: (context, state) => BlocProvider(
          create: (_) => locator.get<DemoCubit>()..init(),
          child: const DemoPage(),
        ),
      ),
    ],
  );
}
