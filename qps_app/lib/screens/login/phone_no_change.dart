import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class ChangePhoneNo extends StatefulWidget {
  const ChangePhoneNo({Key? key}) : super(key: key);

  @override
  State<ChangePhoneNo> createState() => _ChangePhoneNo();
}

class _ChangePhoneNo extends State<ChangePhoneNo> {
  final TextEditingController phoneController = TextEditingController();

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
                      padding: EdgeInsets.fromLTRB(20, 14, 20, 0),
                      child: Text(
                        'Change Mobile Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff80065d)),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: AppText(
                        text:
                            'We will send you an OTP on your new Mobile Number',
                        fontWeight: FontWeight.w500,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Form(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Column(
                        children: [
                          RoundedInputField2(
                            controller: phoneController,
                            hintText: "Enter new mobile Number",
                            icon: Icons.call,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RoundedButton(
                            text: 'Confirm',
                            press: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const VerifyOTP()));
                            },
                          ),
                          TextLinks(
                              navigatorText: 'Cancel',
                              fontWeight: FontWeight.bold,
                              size: 15,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyOTP()));
                              })
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
                height1: 0.15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
