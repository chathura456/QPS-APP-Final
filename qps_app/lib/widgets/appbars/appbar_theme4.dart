import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class AppBar4 extends StatelessWidget {
  final double height1;
  final Function() onTap;
  const AppBar4({
    Key? key,
    required this.height1,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape5(),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: MediaQuery.of(context).size.height * height1,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xff80065d),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: AppText(
                      text: "Let's Go",
                      size: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.double_arrow,
                    size: 35,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
