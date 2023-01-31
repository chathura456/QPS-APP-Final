import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class MyDialogBox2 extends StatefulWidget {
  const MyDialogBox2({Key? key, this.press, required this.headerText, required this.bodyText}) : super(key: key);
  final Function()? press;
  final String headerText;
  final String bodyText;

  @override
  State<MyDialogBox2> createState() => _MyDialogBox2State();
}

class _MyDialogBox2State extends State<MyDialogBox2> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }
  _buildChild(BuildContext context) => Container(

    height: MediaQuery.of(context).size.height*0.4,
    decoration:
    BoxDecoration(color: Colors.white, shape: BoxShape.rectangle
        ,borderRadius: BorderRadius.circular(20)
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
              child: Icon(Icons.logout_rounded,size: 100,color: AppColors.kPrimaryColor,)),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Text(
              widget.headerText,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              widget.bodyText,
              style:
              const TextStyle(fontSize: 14, color: AppColors.kPrimaryColor
              ,fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style:
                        TextButton.styleFrom(primary: AppColors.kPrimaryColor),
                    child: const Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  ),
              ElevatedButton(
                  onPressed: widget.press,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor),
                  child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            ],
          )
        ],
      ),
    ),
  );
}
