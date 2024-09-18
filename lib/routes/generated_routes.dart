import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/landing/bloc/landing_page_bloc.dart';
import '../features/landing/ui/landing_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final LandingPageBloc landingPageBloc = LandingPageBloc();

    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
              value: landingPageBloc, child: const LandingPage()),
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
