import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2(
      {Key? key, this.press, required this.text, this.textColor = Colors.white, this.buttonColor=AppColors.kPrimaryColor})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      margin: const EdgeInsets.only(top: 15,bottom: 0),
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle: TextStyle(
            letterSpacing: 2,
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          )),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }
}