import 'package:flutter/material.dart';
import 'package:json_parshing/screens/Lec-8.2/view/user_screen.dart';
import 'package:json_parshing/screens/Lec-8.3/view/posts_screen.dart';

import '../screens/Lec-8.1/view/homescreen.dart';

class MyRoutes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/' : (context) => const PostsScreen(),
    '/user' : (context) => const UserScreen(),
    '/home' : (context) => const HomeScreen(),
  };
}