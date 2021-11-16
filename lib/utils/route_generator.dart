import 'package:flutter/material.dart';
import 'package:furniture/pages/details.dart';
import 'package:furniture/pages/homepage.dart';
import 'package:furniture/utils/furniture_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/details':
        Products args = settings.arguments as Products;
        return MaterialPageRoute(
          builder: (context) => Details(
            description: args.description,
            imgUrl: args.imgUrl,
            name: args.name,
            price: args.price,
            ratings: args.ratings,
            reviews: args.reviews,
            tag: args.tag,
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (builder) {
        return Scaffold(
          body: Center(child: Text("Page not found")),
        );
      },
    );
  }
}
