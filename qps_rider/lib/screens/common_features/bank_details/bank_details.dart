import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Bank Details', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
