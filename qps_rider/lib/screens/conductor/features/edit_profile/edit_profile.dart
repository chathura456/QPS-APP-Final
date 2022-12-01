import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class EditProfile extends StatelessWidget {
  const EditProfile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Edit Profile', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
