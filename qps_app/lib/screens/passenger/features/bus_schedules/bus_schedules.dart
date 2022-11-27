import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class BusSchedules extends StatelessWidget {
  const BusSchedules ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Bus Schedules', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
