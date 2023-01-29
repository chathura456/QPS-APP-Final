import 'package:flutter/material.dart';
import 'package:qps_app/screens/login/testhome.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qps_app/widgets/colors.dart';
import 'package:provider/provider.dart';

class LoginStatusCheck extends StatefulWidget {
  const LoginStatusCheck({Key? key}) : super(key: key);

  @override
  State<LoginStatusCheck> createState() => _LoginStatusCheckState();
}

class _LoginStatusCheckState extends State<LoginStatusCheck> {
  UserModel loginUser = UserModel();
  User? user=FirebaseAuth.instance.currentUser;





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
                  //Provider.of<UserProvider>(context, listen: false).user = loginUser;
                  WidgetsBinding.instance.addPostFrameCallback((_) => setUserData(loginUser));
                  if(loginUser.type == 'Passenger'){
                    return HomePageNavigator(userData: loginUser,);
                  }
                  else {
                    return const WelcomeScreen();
                  }
                }
                return const WelcomeScreen();
              },
              stream: FirebaseFirestore.instance.collection("Users").doc(
                  snapshot.data?.uid).snapshots(includeMetadataChanges: true),
            );
            //return const HomePageNavigator();
            //return const TestHomePage(userModel: ,);
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
/*
  Future<UserModel> _fetchUserData(String uid) async {
    UserModel loginUser = UserModel();
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    docRef.get().then((value) {
      loginUser= UserModel.fromMap(value.data());
    }).whenComplete(() {
      docRef.collection('Payment_History').doc(uid).get().then((value1) => {
        loginUser.passenger = PassengerModel.fromMap(value1.data())
      });
    });
    return loginUser;
  }*/
}

/*
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
            return const HomePageNavigator();
            //return const TestHomePage(userModel: ,);
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
/*
  Future<UserModel> _fetchUserData(String uid) async {
    UserModel loginUser = UserModel();
    final docRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    docRef.get().then((value) {
      loginUser= UserModel.fromMap(value.data());
    }).whenComplete(() {
      docRef.collection('Payment_History').doc(uid).get().then((value1) => {
        loginUser.passenger = PassengerModel.fromMap(value1.data())
      });
    });
    return loginUser;
  }*/
}
 */