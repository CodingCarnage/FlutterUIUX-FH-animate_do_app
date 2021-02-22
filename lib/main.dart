import 'package:flutter/material.dart';

import 'package:animate_do_app/src/pages/navigation_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'animate_do App',
      home: NavigationPage(),
    );
  }
}