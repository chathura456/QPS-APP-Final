import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class OwnerBusTracking extends StatelessWidget {
  const OwnerBusTracking ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Bus Tracking', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}