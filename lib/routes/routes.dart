import 'package:flutter/material.dart';
import 'package:json_parshing/screens/view/homescreen.dart';

class MyRoutes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/' : (context) => const HomeScreen(),
  };
}