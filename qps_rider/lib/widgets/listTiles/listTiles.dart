import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class MyListTiles extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Widget nextScreen;
  const MyListTiles(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.nextScreen})
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextScreen));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return Colors.white; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.kPrimaryColor10;
              }
              return Colors.white; // Use the component's default.
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              color: AppColors.kPrimaryColor,
              size: 55,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
