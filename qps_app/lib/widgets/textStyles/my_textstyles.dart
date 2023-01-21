import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

Widget leftText(String name){
  return Text(
    name,
    style: const TextStyle(color: AppColors.kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 16),
  );
}

Widget rightText(String name){
  return Text(
    name,
    style: const TextStyle(color: AppColors.kPrimaryColor,fontSize: 16),
    maxLines: 2,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
  );
}

class TicketData extends StatelessWidget {
  const TicketData({Key? key, required this.leftText1, required this.rightText1}) : super(key: key);
  final String leftText1;
  final String rightText1;

  @override
  Widget build(BuildContext context) {
    double customWith = MediaQuery.of(context).size.width;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: customWith*0.3,
          child:  Padding(
            padding: EdgeInsets.only(left: customWith*0.10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftText(leftText1),
              ],
            ),
          ),
        ),
        SizedBox(
          width: customWith*0.07,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftText(':'),
            ],
          ),
        ),
        SizedBox(
          width: customWith*0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rightText(rightText1),
            ],
          ),
        ),


      ],
    );
  }
}
