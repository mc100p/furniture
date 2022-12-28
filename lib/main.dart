import 'package:flutter/material.dart';
import 'package:furniture/pages/homepage/homepage.dart';
import 'package:furniture/utils/route_generator.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

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
      // initialRoute: RouteNames.homepage,
      // onGenerateRoute: RouteGenerator.generateRoute,
      // home: HomePage(),
      routeInformationParser: RouteGenerator().router.routeInformationParser,
      routerDelegate: RouteGenerator().router.routerDelegate,
      // routeInformationProvider:
      //     RouteGenerator().router.routeInformationProvider,
    );
  }
}
