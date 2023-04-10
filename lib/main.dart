import 'package:flutter/material.dart';
import 'package:your_shop_app/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RegisterScreen.routeName,
      routes: {
        RegisterScreen.routeName : (context) => RegisterScreen(),

      },
    );
  }
}
