import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class ActiveBus extends StatelessWidget {
  const ActiveBus ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Active Bus ', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
