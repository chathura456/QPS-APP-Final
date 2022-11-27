import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Settings', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
