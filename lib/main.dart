import 'package:flutter/material.dart';
import 'package:json_parshing/routes/routes.dart';
import 'package:json_parshing/screens/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PhotosProvider(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: MyRoutes.myRoutes,
    );
  }
}
