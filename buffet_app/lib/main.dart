import 'package:flutter/material.dart';

import 'screens/main_menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buffet App',
      home: MenuScreen(),
    );
  }
}


