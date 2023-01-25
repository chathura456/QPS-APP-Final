import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qps_app/screens/login/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestHomePage extends StatelessWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Home Page'),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              signOut();
              Fluttertoast.showToast(msg: 'Sign out Success');
             /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const LoginScreen()));*/

            },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
  Future<void>signOut()async{
    await FirebaseAuth.instance.signOut();
  }
}
