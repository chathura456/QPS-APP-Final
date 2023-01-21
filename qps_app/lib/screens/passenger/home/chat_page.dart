import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class Chat1 extends StatefulWidget {
  const Chat1({Key? key}) : super(key: key);

  @override
  State<Chat1> createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Support'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
