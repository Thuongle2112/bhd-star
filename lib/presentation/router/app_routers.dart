import 'package:bhd_star/presentation/router/bottom_bar.dart';
import 'package:bhd_star/presentation/router/routers_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../pages/splash_screen/splash_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRouters {
  static final GoRouter router = GoRouter(
    initialLocation: RouterName.splashScreen,
    routes: [
      GoRoute(
        path: RouterName.splashScreen,
        name: RouterName.splashScreen,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RouterName.bottomBar,
        name: RouterName.bottomBar,
        builder: (context, state) {
          return const BottomBar();
        },
      ),
    ],
    redirect: (context, state) async {},
    observers: [RouteObserver(), routeObserver],
  );
}
