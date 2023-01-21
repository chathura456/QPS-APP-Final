import 'package:flutter/material.dart';
import 'package:qps_app/widgets/colors.dart';

//custom ElevatedButton used for QR Generator
class BorderButton extends StatelessWidget {
  const BorderButton(
      {Key? key, this.press, required this.text, this.textColor = Colors.white})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      /*decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor,),
        borderRadius: BorderRadius.circular(20),
      ),*/
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child:  newElevatedButton2(),

    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(width: 1.0,style: BorderStyle.solid,color: AppColors.kPrimaryColor),
          backgroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle: const TextStyle(
            letterSpacing: 2,
            color: AppColors.kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          )),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.kPrimaryColor, fontSize: 20),
      ),
    );
  }
  Widget newElevatedButton2() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: BorderSide(width: 2.0,color: AppColors.kPrimaryColor60),),
        //side: const BorderSide(width: 1.0,style: BorderStyle.solid,color: AppColors.kPrimaryColor),
          backgroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle: const TextStyle(
            letterSpacing: 2,
            color: AppColors.kPrimaryColorLight,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          )),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.kPrimaryColorLight, fontSize: 20),
      ),
    );
  }
}