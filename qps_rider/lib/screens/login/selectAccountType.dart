import 'package:qps_rider/screens/login/verify_otp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class AccountSelect extends StatefulWidget {
  const AccountSelect({Key? key}) : super(key: key);

  @override
  State<AccountSelect> createState() => _AccountSelect();
}

class _AccountSelect extends State<AccountSelect> {
  String? acctype;
  String? _genderRadioBtnVal;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColors.kPrimaryColorDark,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.3,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: const AppBar2(
                height1: 0.3,
                height2: 0.15,
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Select Account Type',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff80065d)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: AppText(
                          fontWeight: FontWeight.w500,
                          text:
                              "Once you choose your account type, it cannot be undone. So choose correctly."),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "C",
                                          groupValue: _genderRadioBtnVal,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Conductor'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "O",
                                          groupValue: _genderRadioBtnVal,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Owner'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "S",
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          groupValue: _genderRadioBtnVal,
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Seller'),
                                        /*Flexible(
                                          flex: 1,
                                          child: Row(
                                            children: [

                                              const AppText(text: 'Seller'),
                                            ],
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          text: 'Confirm',
                          press: () {
                            if (_genderRadioBtnVal == null) {
                              Fluttertoast.showToast(
                                msg: "Please Select Account Type",
                                backgroundColor: AppColors.kPrimaryColorDark,
                                textColor: Colors.white,
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => MyDialogBox(
                                      type: acctype!,
                                      press: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const VerifyOTP()));
                                      }));
                            }
                          },
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomAppBar(
              elevation: 0.0,
              color: Colors.transparent,
              child: AppBar3(
                height1: 0.15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _genderRadioBtnVal = value;
      if (_genderRadioBtnVal == "C") {
        acctype = "Conductor";
      } else if (_genderRadioBtnVal == "O") {
        acctype = "Owner";
      }
      if (_genderRadioBtnVal == "S") {
        acctype = "Seller";
      }
    });
  }
}
