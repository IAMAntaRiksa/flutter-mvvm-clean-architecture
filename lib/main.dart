import 'package:flutter/material.dart';
import 'package:flutter_app/global_providers.dart';
import 'package:flutter_app/injector.dart';
import 'package:flutter_app/ui/router/router_generator.dart';
import 'package:flutter_app/ui/router/router_list.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  setupInjector();

  /// Registering global providers
  var providers = await GlobalProviders.register();
  runApp(MyApp(providers: providers));
}

class MyApp extends StatelessWidget {
  final List<SingleChildWidget> providers;
  const MyApp({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: routeHome,
        onGenerateRoute: RouterGenerator.generate,
      ),
    );
  }
}
