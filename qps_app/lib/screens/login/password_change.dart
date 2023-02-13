import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController pswretypeController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  bool swap = false;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColors.kPrimaryColorDark,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.25,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: const AppBar2(
                height1: 0.25,
                height2: 0.125,
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Column(
                        children: [
                          RoundedInputField2(
                            controller: otpController,
                            hintText: "Enter OTP code",
                            icon: Icons.vpn_key,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedInputField2(
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Password field cannot be null");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Please Enter a Valid Password(Min, 6 Characters)");
                              }
                              return null;
                            },
                            isPassword: true,
                            controller: pswController,
                            hintText: "New Password",
                            icon: Icons.lock,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedInputField2(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Retype Password field cannot be null");
                              }
                              if (pswretypeController.text !=
                                  pswController.text) {
                                return ("Password don't match");
                              }
                              return null;
                            },
                            isPassword: true,
                            controller: pswretypeController,
                            hintText: "Retype New Password",
                            icon: Icons.lock,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RoundedButton(
                            text: 'Confirm',
                            press: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                          ),
                          UnderPart(
                              navigatorText: "Resend OTP",
                              title: "Don't receive the OTP?",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordScreen()));
                              }),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomAppBar(
              elevation: 0.0,
              color: Colors.transparent,
              child: AppBar3(
                height1: 0.12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
