import 'package:flutter/material.dart';
import '/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/colors.dart';
import 'package:provider/provider.dart';

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
            return StreamBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  UserModel loginUser=UserModel();
                  loginUser= UserModel.fromMap(snapshot.data);
                  WidgetsBinding.instance.addPostFrameCallback((_) => setUserData(loginUser));

                  if(loginUser.type == 'Conductor'){
                    return const HomePageNavigator(type: 'conductor');
                  }else if(loginUser.type == 'Owner'){
                    return const HomePageNavigator(type: 'owner');
                  }else if(loginUser.type == 'Seller'){
                    return const HomePageNavigator(type: 'seller');
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

  void setUserData(UserModel user) {
    Provider.of<UserProvider>(context, listen: false).user = user;
    print('data added');
  }
}
