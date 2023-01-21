import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class PushNotifications extends StatelessWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Notifications', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
