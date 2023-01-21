import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Seller Dashboard', context),
      body: Center(
        child: Column(children:  const [
          Text('Under Development'),
        ]),
      ),
    );
  }
}