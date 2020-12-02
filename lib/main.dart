import 'package:flutter/material.dart';
import './Screens/HomeScreen.dart';
import './Screens/Add_Screen.dart';
import './Screens/Post_Detail.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      title: 'Testing Route!',
      // home: Home(),
      initialRoute: 'home',
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        AddScreen.route: (context) => AddScreen(),
        PostDetail.route: (context) => PostDetail(),
      },
    );
  }
}
