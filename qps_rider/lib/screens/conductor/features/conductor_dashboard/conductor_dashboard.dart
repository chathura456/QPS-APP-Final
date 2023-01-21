import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class ConductorDashboard extends StatelessWidget {
  const ConductorDashboard ({Key? key}) : super(key: key);

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
