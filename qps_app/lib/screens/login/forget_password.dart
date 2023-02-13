import 'package:qps_app/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/screens.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                        'Forget Password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: AppText(
                        text:
                            'We will send you an OTP on this Mobile Number or  Email Address',
                        fontWeight: FontWeight.w500,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Column(
                        children: [
                          if (isVisible) ...[
                            RoundedInputField2(
                              controller: emailController,
                              hintText: "Enter your Email",
                              icon: Icons.email,
                            ),
                          ] else ...[
                            RoundedInputField2(
                              controller: phoneController,
                              hintText: "Enter your Phone Number",
                              icon: Icons.call,
                            ),
                          ],
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: TextLinks(
                                  navigatorText: isVisible
                                      ? 'Use Phone Number'
                                      : 'Use Email Address',
                                  fontWeight: FontWeight.w500,
                                  size: 15,
                                  onTap: () =>
                                      setState(() => isVisible = !isVisible),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            text: 'Get OTP',
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePasswordScreen()));
                            },
                          ),
                          TextLinks(
                              navigatorText: 'Back to login?',
                              fontWeight: FontWeight.bold,
                              size: 15,
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
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
