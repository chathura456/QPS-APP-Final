import 'package:nanoid/nanoid.dart';
import 'package:flutter/material.dart';
import '../../widgets/my_widgets.dart';
import '../screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool loading = false;
  var custom_id = customAlphabet('1234567890', 6);
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

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
                toolbarHeight: MediaQuery.of(context).size.height * 0.2,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: const AppBar1(
                  height1: 0.2,
                  height2: 0.125,
                ),
              ),

              //Body elements design
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Sign up',
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
                              'Please Sign up with new Account to continue with QPS App',
                          fontWeight: FontWeight.w500,
                          size: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          key: RegisterScreen._registerFormKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Column(
                              children: [
                                MyInputField(
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{3,}$');
                                    if (value!.isEmpty) {
                                      return ("User Name cannot be null");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter a Valid Name(Min, 3 Characters)");
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                  hintText: "User Name",
                                  icon: Icons.account_circle,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
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
                                  hintText: "Email",
                                  icon: Icons.email,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyInputField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Phone Number cannot be null");
                                    }
                                    return null;
                                  },
                                  controller: phoneController,
                                  hintText: "Phone Number",
                                  icon: Icons.call,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                MyInputField(
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is required for Register");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Please Enter a Valid Password(Min, 6 Characters)");
                                    }
                                  },
                                  controller: passwordController,
                                  icon: Icons.key,
                                  hintText: 'Password',
                                  isPassword: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                loading
                                    ? const Loading()
                                    : RoundedButton(
                                        text: 'Sign up',
                                        press: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AccountSelect()));
                                          //signUp(emailController.text,passwordController.text);
                                        },
                                      ),
                                UnderPart(
                                    navigatorText: "Login here",
                                    title: "Already have an account?",
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
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
