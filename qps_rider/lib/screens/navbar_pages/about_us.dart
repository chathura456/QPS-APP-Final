import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('About Us', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
