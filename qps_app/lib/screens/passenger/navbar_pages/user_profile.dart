import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

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
          children: const [
           /* ElevatedButton(
              onPressed: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TicketPackages()));*/
              },
              child: const Text('Nested Page'),
            ),*/
            Text('Under Development'),
          ],

        ),
      ),
    );
  }
}
