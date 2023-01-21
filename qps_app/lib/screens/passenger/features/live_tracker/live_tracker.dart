import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class LiveTracker extends StatelessWidget {
  const LiveTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Live Tracker', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
