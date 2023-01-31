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
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                  Text('Waiting for Connection..', style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              ),
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
                  else if(loginUser.type == 'Passenger'){
                    return const WelcomeScreen();
                  } else if(loginUser.type == null){
                    return const AccountSelect();
                  }
                }
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                        SizedBox(height: 20,),
                        Text('Validating Data..', style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                );
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
        if(snapshot.connectionState == ConnectionState.none){
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                  Text('No internet Connection..',
                    style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
          );
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
