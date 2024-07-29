import 'package:flutter/material.dart';
import 'package:flutter_widgets/main/main_page.dart';
import 'package:flutter_widgets/router/app_route_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      onGenerateRoute: appGenerateRoute,
    );
  }
}
