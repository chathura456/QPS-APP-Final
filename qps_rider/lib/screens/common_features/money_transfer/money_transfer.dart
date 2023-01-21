import '../../seller/seller_home.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Under Development'),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SellerHome()));
            }, child: const Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}
