import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  const MyDialogBox({Key? key, required this.press}) : super(key: key);
  final Function()? press;

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
        height: 400,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Image.asset(
                    'asset/vector/confirm.png',
                    height: 100,
                    width: 100,
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: Text(
                  "Account type Selected as Passenger",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  "Note: You can never change the account type after pressing the confirmation button. If you want to change your account type now, you can click Cancel button.",
                  style:
                      TextStyle(fontSize: 14, color: AppColors.kPrimaryColor),
                  textAlign: TextAlign.justify,
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
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                      onPressed: press,
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.kPrimaryColor),
                      child: const Text('Confirm')),
                ],
              )
            ],
          ),
        ),
      );
}
