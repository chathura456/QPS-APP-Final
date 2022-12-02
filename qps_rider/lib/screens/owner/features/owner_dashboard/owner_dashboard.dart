import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class OwnerDashboard extends StatelessWidget {
  const OwnerDashboard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Owner Dashboard ', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}