import 'package:nanoid/nanoid.dart';
import 'package:flutter/material.dart';
import 'package:qps_app/screens/login/testhome.dart';
import '../../main.dart';
import '../../widgets/my_widgets.dart';
import '../screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _regFormKey = GlobalKey<FormState>(debugLabel: '_regScreenKey');
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
                          key: _regFormKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Column(
                              children: [
                                LatestInputField(
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
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
                                LatestInputField(
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
                                  controller: emailController,
                                  hintText: "Email",
                                  icon: Icons.email,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                LatestInputField(
                                  keyboardType: TextInputType.number,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
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
                                LatestInputField(
                                  keyboardType: TextInputType.number,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
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
                                /*loading
                                    ? const Loading()
                                    : RoundedButton(
                                        text: 'Sign up',
                                        press: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VerifyOTP()));
                                          //signUp(emailController.text,passwordController.text);
                                        },
                                      ),*/
                                loading
                                    ? const Loading()
                                    :RoundedButton(
                                  text: 'Sign up',
                                  press: () {
                                    signUp();
                                    /*Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const VerifyOTP()));*/
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

  Future signUp() async {
    final isValid = _regFormKey.currentState!.validate();
    if (!isValid) {
      Fluttertoast.showToast(msg: 'check again you entered data!!');
      return;}
    setState(() {
      loading = true;
    });

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text).then((value) async {
        try{
          final db =  FirebaseFirestore.instance;
          final newUser = UserModel(
              email: value.user?.email,
              name: nameController.text.trim(),
              type: 'Passenger',
              phone: phoneController.text.trim(),
              points: '000'
          );
          await db.collection("Users").doc(value.user?.uid).set(newUser.toMap()).then((value) {
            Fluttertoast.showToast(msg: 'User Registration Success!!');
            navigatorKey.currentState!.popUntil((route) => route.isFirst);
          }).whenComplete(() async {
            const passenger = PassengerModel(
                payment: 'no data',
                amount: '1256',
                date: 'no data',
                description: 'no data'
            );
            //await db.collection('Payment_History').doc(value.user?.uid).set(passenger.toJason());
            await db.collection("Users").doc(value.user?.uid).collection('Payment_History').doc(value.user?.uid).set(passenger.toJason());
          }).whenComplete(() async {
            try{
              final sfDocRef = db.collection("Users").doc('counter');
              await db.runTransaction((transaction) async {
                final snapshot = await transaction.get(sfDocRef);
                // Note: this could be done without a transaction
                //       by updating the population using FieldValue.increment()
                final lastID = snapshot.get("latest");
                String newID = (int.parse(lastID)+1).toString();
                try{
                  final userRef= FirebaseFirestore.instance.collection("Users").doc(value.user?.uid);
                  final currentUser = UserModel(
                      uid: newID
                  );
                  await userRef.update(currentUser.updateIdJason()
                  );
                }on FirebaseException catch (e){
                  Fluttertoast.showToast(msg: '${e.message}');
                }
                transaction.update(sfDocRef, {"latest": newID},);
              });
            }on FirebaseException catch (e){
              Fluttertoast.showToast(msg: '${e.message}');
            }
          });

        }on FirebaseException catch (e){
          Fluttertoast.showToast(msg: '${e.message}');
        }
      });

    }on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: '${e.message}');

    }
    if(mounted){
      setState(() {
        loading = false;
      });
    }



    /*
    * try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text).whenComplete(() {
        Fluttertoast.showToast(msg: 'User Create Success');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const TestHomePage()));

      });

    }on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: '${e.message}');

    }*/
  }
}