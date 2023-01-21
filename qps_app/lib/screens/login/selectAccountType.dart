import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class AccountSelect extends StatefulWidget {
  const AccountSelect({Key? key}) : super(key: key);

  @override
  State<AccountSelect> createState() => _AccountSelect();
}

class _AccountSelect extends State<AccountSelect> {
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
                              "Once you choose your account type, it cannot be undone"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: "P",
                                          groupValue: _genderRadioBtnVal,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.kPrimaryColor),
                                          onChanged: _handleGenderChange,
                                        ),
                                        const AppText(text: 'Passenger'),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
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
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
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
                                  Flexible(
                                    flex: 1,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          text: 'Confirm',
                          press: () {
                            showDialog(
                                context: context,
                                builder: (context) => MyDialogBox(press: () {
                                      // UpdateAccountType();
                                    }));

                            /* AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed:(){Navigator.pop(context, 'OK');},
                                 //onPressed: () {UpdateAccountType();},
                                  child: const Text('OK'),
                                ),
                              ],
                            );*/

                            // UpdateAccountType();

                            //print(_genderRadioBtnVal);
                            /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const VerifyOTP()));*/
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
    });
  }
}
