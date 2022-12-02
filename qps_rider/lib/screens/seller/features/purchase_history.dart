import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Purchase History', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}