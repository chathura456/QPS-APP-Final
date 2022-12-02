import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class MyAds extends StatelessWidget {
  const MyAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('My Ads', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}