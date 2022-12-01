import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class Offers1 extends StatefulWidget {
  const Offers1({Key? key}) : super(key: key);

  @override
  State<Offers1> createState() => _Offers1State();
}

class _Offers1State extends State<Offers1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Offers'),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
