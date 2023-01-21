import 'package:flutter/material.dart';

//common ElevatedButton template used for all login and registration forms
class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, this.press, required this.text, this.textColor = Colors.white})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff80065d),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
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

//custom ElevatedButton used for QR Generator
class RoundedButton2 extends StatelessWidget {
  const RoundedButton2(
      {Key? key, this.press, required this.text, this.textColor = Colors.white})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
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
          backgroundColor: const Color(0xff80065d),
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
