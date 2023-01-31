import 'package:qps_rider/main.dart';

import '/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>const LoginStatusCheck());
      case '/login':
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_)=>const RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_)=>const TestHomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
    /*case '/welcome':
        return MaterialPageRoute(builder: (_)=>const WelcomePage());*/
      default:
        return _errorRoute();

    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text('Error page'),),
        body: const Center(
          child: Text('Something went wrong!!'),
        ),
      );
    });
  }
}
