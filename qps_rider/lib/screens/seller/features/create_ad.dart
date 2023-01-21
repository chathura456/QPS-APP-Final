import 'package:flutter/material.dart';

import '../../../../widgets/colors.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Ad'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Under Development'),
          ],
        ),
      ),
    );
  }
}
