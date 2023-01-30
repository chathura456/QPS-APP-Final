import 'package:flutter/material.dart';
import 'package:qps_app/screens/passenger/features/qr_scan/qr_scanner.dart';
import 'package:qps_app/widgets/my_widgets.dart';
import '../../../widgets/routes/tab_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qps_app/screens/screens.dart';
import 'package:provider/provider.dart';



class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key}) : super(key: key);
  //final UserModel userData;

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {

  var _currentTab = TabItem.home;
  //User? user=FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();
  User? user=FirebaseAuth.instance.currentUser;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.offers: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };
/*
  @override
  void initState(){
    super.initState();
    if(user!=null){
      var db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
      db.get().then((value) {
        loginUser= UserModel.fromMap(value.data());

      } ).whenComplete(() {
        db.collection('Payment_History').doc(user!.uid).get().then((value1) {
          loginUser.passenger = PassengerModel.fromMap(value1.data());
        }).whenComplete(() {
          //Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
          if(mounted){
            setState(() {
              Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
              print('init state');
            });
          }
        });
      });
    }
  }*/
/*
  @override
  void initState(){
    super.initState();
    User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      var db = FirebaseFirestore.instance.collection("Users").doc(user.uid);
      db.get().then((value) {
        loginUser= UserModel.fromMap(value.data());

      } ).whenComplete(() {
        db.collection('Payment_History').doc(user.uid).get().then((value1) {
          loginUser.passenger = PassengerModel.fromMap(value1.data());
        }).whenComplete(() {
          if(mounted){
            setState(() {
              Provider.of<UserProvider>(context, listen: false).setUser(loginUser);
            });
          }
        });
      });
    }


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



  }*/

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }



  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.offers),
          _buildOffstageNavigator(TabItem.chat),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar: MyBottomBar(
          onSelectTab: _selectTab,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 2.0,
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            size: 30,
          ),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const QRScanner()))
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem1) {
    return Offstage(
      offstage: _currentTab != tabItem1,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem1],
        tabItem: tabItem1,
      ),
    );
  }
}
