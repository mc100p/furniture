import 'package:flutter/material.dart';
import 'package:furniture/pages/details/details.dart';
import 'package:furniture/pages/homepage/homepage.dart';
import 'package:furniture/utils/magic_string.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteNames.homepage:
          return HomePage();

        case RouteNames.detailPage:
          Details args = settings.arguments as Details;
          return Details(
            itemList: args.itemList,
          );
        default:
          return ErrorRoute();
      }
    });
  }
}

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error - 400"),
      ),
      body: Center(
        child: Text(
          "Page Not Found....",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
