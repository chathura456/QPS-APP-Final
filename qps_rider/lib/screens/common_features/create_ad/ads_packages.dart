import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class AdPackages extends StatelessWidget {
  const AdPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Ad Packages', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}