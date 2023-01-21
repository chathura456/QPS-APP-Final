import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Payment History', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
