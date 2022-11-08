import 'package:flutter/material.dart';
import 'package:furniture/pages/homepage/homepage.dart';
import 'package:furniture/utils/magic_string.dart';
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
        colorScheme: ColorScheme.light(
          primary: Colors.black,
        ).copyWith(secondary: Colors.grey[200]),
      ),
      initialRoute: RouteNames.homepage,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
