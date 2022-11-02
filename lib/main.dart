import 'package:flutter/material.dart';
import 'package:movie_app/core/utilities/navigator_key_service.dart';
import 'package:movie_app/routes/route.dart';

void main() {
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: "/",
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
