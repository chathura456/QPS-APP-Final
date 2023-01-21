import 'package:flutter/material.dart';
import '../../widgets/my_widgets.dart';
import '../screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

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
                              color: Color(0xff80065d)),
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
                          key: LoginScreen._formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Column(
                              children: [
                                MyInputField(
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
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyInputField(
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
                                  isPassword: true,
                                  icon: Icons.key,
                                  hintText: 'Password',
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
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePageNavigator(type: 'conductor',),
                                              ));

                                          //signIn(emailController.text, passwordController.text, context);
                                        },
                                      ),
                                UnderPart(
                                    navigatorText: "Register here",
                                    title: "Don't have an account?",
                                    onTap: () {
                                      LoginScreen._formKey.currentState
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
}
