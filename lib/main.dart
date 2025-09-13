import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/high_fidelity_onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/high_fidelity_onboarding',
  routes: [
    GoRoute(
      path: '/high_fidelity_onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const HighFidelityOnboardingScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
