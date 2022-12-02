import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({Key? key}) : super(key: key);

  @override
  State<MoneyTransfer> createState() => _QRScanner();
}

class _QRScanner extends State<MoneyTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Money Transfer', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
