import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_shop_app/screens/register/register_screen.dart';
import 'package:your_shop_app/shared/network/remote/dio_helper.dart';
import 'my_bloc_opserver.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
    );
  }
}
