import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Contact Us', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
