import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const AppText({
    Key? key,
    required this.text,
    this.color = AppColors.kPrimaryColor,
    this.size = 17,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'OpenSans',
      ),
    );
  }
}

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
      required this.navigatorText,
      required this.title,
      this.size = 15,
      required this.onTap,
      this.fontWeight1 = FontWeight.w400,
      this.fontWeight2 = FontWeight.w600,
      this.textDecoration = TextDecoration.underline,
      this.boxSize = 10})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;
  final double size;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final TextDecoration textDecoration;
  final double boxSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: size,
            color: AppColors.kPrimaryColor,
            fontWeight: fontWeight1,
          ),
        ),
        SizedBox(
          width: boxSize,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: size,
              fontWeight: fontWeight2,
              decoration: textDecoration,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }
}

class TextLinks extends StatelessWidget {
  final String navigatorText;
  final Function() onTap;
  final double size;
  final FontWeight fontWeight;
  const TextLinks({
    Key? key,
    required this.navigatorText,
    required this.onTap,
    this.size = 17,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              onTap();
            },
            child: AppText(
              text: navigatorText,
              color: AppColors.kPrimaryColor,
              size: size,
              fontWeight: fontWeight,
            )),
      ],
    );
  }
}
