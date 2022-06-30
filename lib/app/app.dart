import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/presentation/resources/routs_manager.dart';
import '../presentation/resources/theme_manager.dart';
class MyApp extends StatefulWidget {
  MyApp._inrernal();
  static final MyApp _instance=MyApp._inrernal(); //singleton or single instance
  factory MyApp()=>_instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
