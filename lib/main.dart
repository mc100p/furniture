import 'package:flutter/material.dart';
import 'package:furniture/pages/homepage.dart';
import 'package:furniture/utils/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.grey[200],
        colorScheme: ColorScheme.light(
          primary: Colors.black,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
