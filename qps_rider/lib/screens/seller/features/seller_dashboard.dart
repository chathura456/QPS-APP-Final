import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';
import 'package:provider/provider.dart';
import 'package:qps_rider/screens/screens.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child ){
        return Scaffold(
          appBar: commonAppBar('Seller Dashboard ', context),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Under Development'),
                  Text('${userProvider.user.sellerModel?.duration}')
                ]),
          ),
        );
      },

    );
  }
}