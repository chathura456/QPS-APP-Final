import 'package:flutter/material.dart';

import '../../../../widgets/colors.dart';

class BusManager extends StatefulWidget {
  const BusManager({Key? key}) : super(key: key);

  @override
  State<BusManager> createState() => _BusManagerState();
}

class _BusManagerState extends State<BusManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Manager'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Under Development'),
          ],
        ),
      ),
    );
  }
}
