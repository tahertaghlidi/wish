import 'package:flutter/material.dart';
import './screens/loading_screen.dart';

void main() {
  runApp(Wish());
}

class Wish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: ThemeData.light().textTheme.apply(fontFamily: 'iransans')),
      home: LoadingScreen(),
    );
  }
}
