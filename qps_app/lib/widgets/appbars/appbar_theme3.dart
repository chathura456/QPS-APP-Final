import 'package:flutter/cupertino.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class AppBar3 extends StatelessWidget {
  final double height1;
  const AppBar3({
    Key? key,
    required this.height1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape4(),
      child: Container(
        height: MediaQuery.of(context).size.height * height1,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff80065d),
      ),
    );
  }
}
