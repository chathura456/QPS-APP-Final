import 'package:flutter/cupertino.dart';
import '/widgets/my_widgets.dart';

class AppBar2 extends StatelessWidget {
  final double height1;
  final double height2;
  const AppBar2({Key? key, required this.height1, required this.height2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape2(),
      child: Container(
        height: MediaQuery.of(context).size.height * height1,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff80065d),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/logo/logo2.png',
              height: MediaQuery.of(context).size.height * (height2),
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
