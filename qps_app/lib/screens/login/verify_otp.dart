import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTP();
}

class _VerifyOTP extends State<VerifyOTP> {
  final TextEditingController otpController = TextEditingController();

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
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'OTP Verification',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    UnderPart(
                        navigatorText: "+94 771234567",
                        title: "Enter the OTP send to",
                        size: 16,
                        fontWeight1: FontWeight.w500,
                        fontWeight2: FontWeight.w900,
                        boxSize: 7,
                        textDecoration: TextDecoration.none,
                        onTap: () {}),
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
                            height: 15,
                          ),
                          UnderPart(
                              navigatorText: "Resend OTP",
                              title: "Don't receive the OTP?",
                              onTap: () {}),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            text: 'Confirm',
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          ),
                        ],
                      ),
                    )),
                    TextLinks(
                        navigatorText: 'Change Mobile Number',
                        fontWeight: FontWeight.bold,
                        size: 15,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangePhoneNo()));
                        })
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
}
