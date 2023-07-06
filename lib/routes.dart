import 'package:go_router/go_router.dart';
import 'package:posapp/dashboard/dashboard.dart';
import 'package:posapp/login/login.dart';
import 'package:posapp/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    )
  ],
);
