import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class QrDetails extends StatelessWidget {
  const QrDetails({Key? key, required this.qrData}) : super(key: key);
  final String qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Ticket Details', context),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(qrData),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const HomePageNavigator(),
                  ));
            }, child: const Text('Confirm'))
          ],
      ),
      ),
    );
  }
  }

