import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.onboardingScreen, // Initial route
      onGenerateRoute: Routes.generateRoute, // Generating routes
    );
  }
}

