import 'package:flutter/material.dart';

import '../screens/Lec-8.1/view/homescreen.dart';

class MyRoutes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/' : (context) => const HomeScreen(),
  };
}