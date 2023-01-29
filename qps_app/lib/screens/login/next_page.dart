import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qps_app/screens/screens.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Second Page'),),
          // other widgets
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Hello, ${userProvider.user.passenger?.amount}'),
                Text('Hello, ${userProvider.user.name}'),
            ],),
          ),
        );
      },
    );
  }
}
