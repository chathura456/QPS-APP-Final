import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qps_app/screens/login/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:provider/provider.dart';
import '../model/passenger_model.dart';
import '../model/userModel.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key, required this.userModel, }) : super(key: key);
 final UserModel userModel;

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {

  User? user=FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();
  PassengerModel passenger = const PassengerModel();


  @override
  void initState(){
    super.initState();
    var db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    db.get().then((value) {
      loginUser= UserModel.fromMap(value.data());

    } ).whenComplete(() {
      db.collection('Payment_History').doc(user!.uid).get().then((value1) {
        loginUser.passenger = PassengerModel.fromMap(value1.data());
      }).whenComplete(() {
        if(mounted){
          setState(() {
            //Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
          });
        }
      });
    });

    /**
     * var db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
        db.get().then((value) {
        loginUser= UserModel.fromMap(value.data());
        } ).whenComplete(() {
        db.collection('Payment_History').doc(user!.uid).get().then((value1) {
        loginUser.passenger = PassengerModel.fromMap(value1.data());
        });
        }).whenComplete(() {
        if(mounted){
        setState(() {
        Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
        });
        }
        });
     */



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Home Page'), automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SecondPage()));
            }, child: const Text('Next Page')),
            ElevatedButton(onPressed: () {
              signOut();
              Fluttertoast.showToast(msg: 'Sign out Success');
              /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginScreen()));*/

            },
                child: const Text('Logout')),
            const SizedBox(height: 20,),
            //Text('${userProvider.user.passenger?.amount}'),
            //Text('${loginUser.uid}'),
           Text('${widget.userModel.phone}'),
          ],
        ),
      ),
    );
  }


  Future<void>signOut()async{
    await FirebaseAuth.instance.signOut();
  }
}

/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qps_app/screens/login/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:provider/provider.dart';
import '../model/passenger_model.dart';
import '../model/userModel.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key, required this.userModel, }) : super(key: key);
 final UserModel userModel;

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {

  User? user=FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();
  PassengerModel passenger = const PassengerModel();


  @override
  void initState(){
    super.initState();
    var db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    db.get().then((value) {
        loginUser= UserModel.fromMap(value.data());
    } ).whenComplete(() {
      db.collection('Payment_History').doc(user!.uid).get().then((value1) => {
          loginUser.passenger = PassengerModel.fromMap(value1.data())
      });
    }).whenComplete(() {
      if(mounted){
        setState(() {
         Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
        });
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Home Page'), automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SecondPage()));
            }, child: const Text('Next Page')),
            ElevatedButton(onPressed: () {
              signOut();
              Fluttertoast.showToast(msg: 'Sign out Success');
              /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginScreen()));*/

            },
                child: const Text('Logout')),
            const SizedBox(height: 20,),
            //Text('${userProvider.user.passenger?.amount}'),
            //Text('${loginUser.uid}'),
           Text('${widget.userModel.phone}'),
          ],
        ),
      ),
    );
  }


  Future<void>signOut()async{
    await FirebaseAuth.instance.signOut();
  }
}
 */