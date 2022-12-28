import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture/pages/details/details.dart';
import 'package:furniture/pages/homepage/homepage.dart';
import 'package:furniture/utils/furniture_list.dart';
import 'package:furniture/utils/magic_string.dart';
import 'package:go_router/go_router.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     return MaterialPageRoute(builder: (context) {
//       switch (settings.name) {
//         case RouteNames.homepage:
//           return HomePage();

//         case RouteNames.detailPage:
//           Details args = settings.arguments as Details;
//           return Details(
//             itemList: args.itemList,
//           );
//         default:
//           return ErrorRoute();
//       }
//     });
//   }
// }

class RouteGenerator {
  GoRouter router = GoRouter(
    // initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: RouteNames.detailPage,
        path: '/detailPage',
        builder: (context, state) {
          final args = state.extra! as Products;
          return Details(itemList: args);
        },
        pageBuilder: (context, state) {
          final args = state.extra! as Products;
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Details(itemList: args),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorRoute(),
    errorPageBuilder: (context, state) => MaterialPage(child: ErrorRoute()),
  );
}

class ErrorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error - 400"),
        leading: IconButton(
          icon: IconButton(
            icon: Platform.isIOS
                ? Icon(Icons.arrow_back_ios)
                : Icon(Icons.arrow_back_outlined),
            onPressed: () => Navigator.pop(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
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

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(scale: animation, child: child),
  );
}
