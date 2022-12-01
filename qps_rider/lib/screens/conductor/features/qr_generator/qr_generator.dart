import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);


  @override
  State<QRGenerator> createState() => _QRScanner();
}

class _QRScanner extends State<QRGenerator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text('QR Generator'),
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.kPrimaryColor,
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Under Development'),
          ],
        ),
      ),
    );
  }
}
