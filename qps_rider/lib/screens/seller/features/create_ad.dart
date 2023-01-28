import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';
import 'package:provider/provider.dart';
import 'package:qps_rider/screens/screens.dart';
/*
class CreateAd extends StatefulWidget {
  const CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child ){
        return Scaffold(
          appBar: commonAppBar('Active Bus ', context),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Under Development'),
                  Text('${userProvider.user.sellerModel?.duration}')
                ]),
          ),
        );
      },

    );
  }
}*/

class CreateAd extends StatelessWidget {
  const CreateAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: commonAppBar('Active Bus ', context),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const [
                  Text('Under Development'),
                // Text('${userProvider.user.points}')
                ]),
          ),
        );
  }
}

