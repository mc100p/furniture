import 'package:flutter/material.dart';
import 'package:furniture/utils/route_generator.dart';

void main() {
  runApp(MyApp());
}

var router = RouteGenerator().router;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Furniture',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
        ).copyWith(secondary: Colors.grey[200]),
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
