import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Ads Section', context),
      body: const Center(
        child: Text('Under Development'),
      ),
    );
  }
}
