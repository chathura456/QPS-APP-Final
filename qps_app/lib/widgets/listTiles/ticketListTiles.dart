import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class MyListTiles2 extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color textColor;
  final Color backColor;
  const MyListTiles2(
      {Key? key,
        required this.text, this.press, this.textColor=AppColors.kPrimaryColor, this.backColor=Colors.white,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor10,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return backColor; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return backColor; // Use the component's default.
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            Text(
              'LKR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListTiles1 extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color textColor;
  final Color backColor;
  const MyListTiles1(
      {Key? key,
        required this.text, this.press, this.textColor=AppColors.kPrimaryColor, this.backColor=Colors.white,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kPrimaryColor10,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return backColor; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return backColor; // Use the component's default.
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
