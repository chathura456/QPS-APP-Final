import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import '/screens/screens.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static const String routeName = '/editProfile';

  @override
  State<UserProfile> createState() => _QRScanner();
}

class _QRScanner extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('User Profile', context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoneyTransfer()));
              },
              child: const Text('Nested Page'),
            ),
            const Text('Under Development'),
          ],

        ),
      ),
    );
  }
}
