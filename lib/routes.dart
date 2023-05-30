import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ronda/app/pages/home/bottom_menu.dart';
import 'package:ronda/app/pages/landing.page.dart';
import 'package:ronda/app/pages/login.page.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(
        child: BottomNav(),
        fullscreenDialog: false,
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage(
        child: LoginPage(),
        fullscreenDialog: true,
      ),
    ),
  ],
);
