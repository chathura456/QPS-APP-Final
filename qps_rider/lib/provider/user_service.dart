import 'package:flutter/material.dart';
import '../screens/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }
}
/*
class UserService {
  //...
  Future<UserModel> getUserData(String uid) async {
    var userRef = FirebaseFirestore.instance.collection("Users").doc(uid);
    var userSnapshot = await userRef.get();
    var data = userSnapshot.data();
    //var passengerSnapshot = userRef.collection('Payment_History').doc(uid);
    //var passengerRef = await passengerSnapshot.get();
    //var passengerData = passengerRef.data();

    UserModel loginUser = UserModel();
    loginUser= UserModel.fromMap(data);
    //loginUser.passenger = PassengerModel.fromMap(passengerData);


    return loginUser;
  }
  Future<void> setUserData(BuildContext context, String uid) async {
    Widget widget;
    // UserModel userData = await getUserData(uid);
    //Provider.of<UserProvider>(context, listen: false).setUser(userData);
    FutureBuilder(
      future: UserService().getUserData(uid),
      builder: (context, snapshot) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        if (snapshot.connectionState == ConnectionState.done) {
          widget = userProvider.setUser(snapshot.data?? UserModel());
          return widget; // or any other widgets you want to show
        } else {
          return const CircularProgressIndicator();
        }
      },
    );

  }

}

class UserDataConsumer extends StatelessWidget {
  final Widget child;
  final Function(BuildContext, UserModel) onUserData;

  const UserDataConsumer({super.key, required this.child, required this.onUserData});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (onUserData != null) {
          onUserData(context, userProvider.user);
        }
        return this.child;
      },
    );
  }
}

 */