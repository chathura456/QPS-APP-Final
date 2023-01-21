import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class HomePageSelect extends StatefulWidget {
  const HomePageSelect({Key? key}) : super(key: key);
  static const String routeName = '/page1';

  @override
  State<HomePageSelect> createState() => _HomePageSelectState();
}

class _HomePageSelectState extends State<HomePageSelect> {
  Widget homeScreen = const PassengerHome();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homeScreen));
      },
    );
  }
}
