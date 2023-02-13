import 'package:flutter/material.dart';
import 'package:qps_app/screens/login/testhome.dart';
import '../../main.dart';
import '../../widgets/my_widgets.dart';
import '../screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>(debugLabel: '_loginscreenkey');

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  build(context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: AppColors.kPrimaryColorDark,
          child: SafeArea(
            //Appbar designs
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.3,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: const AppBar1(
                  height1: 0.3,
                  height2: 0.17,
                ),
              ),

              //Body elements design
              body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kPrimaryColor),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        child: AppText(
                          text:
                              'Please Sign in to your Account to continue with QPS App',
                          fontWeight: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          key: _loginFormKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Column(
                              children: [
                                LatestInputField(
                                  controller: emailController,
                                  hintText: 'Email Address',
                                  icon: Icons.email,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter your Email");
                                    }
                                    if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return ("please Enter a Valid Email");
                                    }
                                    return null;
                                  },
                                ),
                                /*RoundedInputField2(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter your Email");
                                    }
                                    if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return ("please Enter a Valid Email");
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  hintText: "Email Address",
                                  icon: Icons.email,
                                ),*/
                                const SizedBox(
                                  height: 15,
                                ),
                                LatestInputField(
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is required for login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Please Enter a Valid Password(Min, 6 Characters)");
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  hintText: 'Password',
                                  isPassword: true,
                                  icon: Icons.key,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 2, 0),
                                      child: TextLinks(
                                          navigatorText: 'Forget Password?',
                                          size: 15.5,
                                          fontWeight: FontWeight.w600,
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ForgetPasswordScreen()));
                                          }),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                loading
                                    ? const Loading()
                                    : RoundedButton(
                                        text: 'Sign in',
                                        press: () {
                                          /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePageNavigator()));*/
                                          /*Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePageNavigator(),
                                              ));*/
                                         /* Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                              builder: (context) =>
                                          const TestHomePage()));*/
                                          signIn();

                                          //signIn(emailController.text, passwordController.text, context);
                                        },
                                      ),
                                UnderPart(
                                    navigatorText: "Register here",
                                    title: "Don't have an account?",
                                    onTap: () {
                                      _loginFormKey.currentState
                                          ?.reset();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterScreen()));
                                    }),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = _loginFormKey.currentState!.validate();
    if (!isValid) {
      Fluttertoast.showToast(msg: 'check again you entered data!!');
      return;
    }
    setState(() {
      loading = true;
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text).then((value) {
        Fluttertoast.showToast(msg: 'Login Success!!');
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      });

    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'You Entered wrong email!!');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'You Entered wrong Password!!');
      }else{
      Fluttertoast.showToast(msg: '${e.message}');}
    }
    setState(() {
      loading = false;
    });
  }
}
