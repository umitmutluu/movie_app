import 'package:flutter/material.dart';
import 'package:movie_app/views/empty_page/empty_page.dart';
import 'package:movie_app/views/search_view/search_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchView());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ErrorPage());
    }

  }


}


