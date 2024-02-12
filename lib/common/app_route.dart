import 'package:clean_architecture_app_2/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const login = '/';
  // static const detailDestination = '/destination/detail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      // case detailDestination:
      //   final destination = settings.arguments;
      //   if (destination == null) return _invalidArgumentPage;
      //   if (destination is! DestinationEntity) return _invalidArgumentPage;
      //   return MaterialPageRoute(
      //     builder: (context) => DetailDestinationPage(
      //       destination: destination,
      //     ),
      //   );
      // case searchDestination:
      //   return MaterialPageRoute(
      //     builder: (context) => const SearchDestinationPage(),
      //   );
      default:
        return _notFoundPage;
    }
  }

  ///jika tidak ada data
  // static MaterialPageRoute get _invalidArgumentPage => MaterialPageRoute(
  //       builder: (context) => const Scaffold(
  //         body: Center(
  //           child: Text('Invalid Argument'),
  //         ),
  //       ),
  //     );

  ///jika tidak ada page
  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        ),
      );
}