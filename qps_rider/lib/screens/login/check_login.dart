import 'package:flutter/material.dart';
import '/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/colors.dart';

class LoginStatusCheck extends StatefulWidget {
  const LoginStatusCheck({Key? key}) : super(key: key);

  @override
  State<LoginStatusCheck> createState() => _LoginStatusCheckState();
}

class _LoginStatusCheckState extends State<LoginStatusCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot){
        if(snapshot.connectionState ==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.active){
          if(snapshot.hasData){
            /*UserModel loginUser=UserModel();
            loginUser= UserModel.fromMap(snapshot.data);
            if(loginUser.type == 'Conductor'){
              return const TestHomePage();
            }else if(loginUser.type == 'Owner'){
              return const TestHomePage();
            }else if(loginUser.type == 'Seller'){
              return const TestHomePage();
            }*/
            //return const AccountSelect();
            return StreamBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  UserModel loginUser=UserModel();
                  loginUser= UserModel.fromMap(snapshot.data);
                  if(loginUser.type == 'Conductor'){
                    return const TestHomePage();
                  }else if(loginUser.type == 'Owner'){
                    return const TestHomePage();
                  }else if(loginUser.type == 'Seller'){
                    return const TestHomePage();
                  }
                  else {
                    return const AccountSelect();
                  }
                }
                return const AccountSelect();
              },
              stream: FirebaseFirestore.instance.collection("Users").doc(
                  snapshot.data?.uid).snapshots(),
            );
          }
          else if(snapshot.hasError){
            return const Center(child: Text('wrong credentials'));
          }
          else{
            return const WelcomeScreen();
          }
        }
        return const WelcomeScreen();
      },
      stream: FirebaseAuth.instance.authStateChanges(),);
  }
}