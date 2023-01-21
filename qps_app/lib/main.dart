import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:page_transition/page_transition.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return const MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'QPS Passenger',
      home: SplshScreen(),
    );
  }
}

class SplshScreen extends StatelessWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('asset/logo/logo2.png', width: 150, height: 150),
          ],
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      nextScreen: const WelcomeScreen(),
      splashIconSize: 150,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
