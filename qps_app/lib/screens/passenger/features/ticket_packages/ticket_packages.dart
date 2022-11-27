import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class TicketPackages extends StatefulWidget {
  const TicketPackages({Key? key}) : super(key: key);

  @override
  State<TicketPackages> createState() => _QRScanner();
}

class _QRScanner extends State<TicketPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Ticket Packages', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
