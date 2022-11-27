import 'package:flutter/cupertino.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class AppBar1 extends StatelessWidget {
  final double height1;
  final double height2;
  const AppBar1({Key? key, required this.height1, required this.height2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape1(),
      child: Container(
        height: MediaQuery.of(context).size.height * height1,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff80065d),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/logo/logo2.png',
              height: MediaQuery.of(context).size.height * (height2),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
