import 'package:flutter/material.dart';
import 'package:flutter_app/ui/router/router_list.dart';
import 'package:flutter_app/ui/screens/Home/home_screen.dart';

class RouterGenerator {
  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case routeSearch:
      //   return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
    }
    return null;
  }
}
