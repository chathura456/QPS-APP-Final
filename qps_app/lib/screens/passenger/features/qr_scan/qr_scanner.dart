import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text('QR Scanner'),
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.kPrimaryColor,
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('back')),
            const SizedBox(height: 20,),
            const Text('Under Development'),
          ],
        ),
      ),
    );
  }
}
