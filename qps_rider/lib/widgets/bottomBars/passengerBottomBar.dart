import '/widgets/my_widgets.dart';
import 'package:flutter/material.dart';
import '/screens/screens.dart';

class BottomBar1 extends StatefulWidget {
  const BottomBar1({Key? key}) : super(key: key);

  @override
  State<BottomBar1> createState() => _BottomBar1State();
}

class _BottomBar1State extends State<BottomBar1> {
  bool keyboardOpen = false;


  int currentTab = 0;
  final List<Widget> screens = [
    const ConductorHome(),
    const Offers1(),
    const Chat1(),
    const UserAccount(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const ConductorHome();
  late Widget homeScreen;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(this.context).padding.bottom;
    bool showFOB = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: bottom + 300),
        child: BottomAppBar(
          elevation: 2.0,
          shape: const CircularNotchedRectangle(),
          color: AppColors.kPrimaryColor,
          notchMargin: 7,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          navigatorKey.currentState!.maybePop();
                          currentScreen = homeScreen;
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color:
                                currentTab == 0 ? Colors.white : Colors.white70,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.white : Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          navigatorKey.currentState!.maybePop();
                          currentScreen = const Offers1();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.discount,
                            color:
                                currentTab == 1 ? Colors.white : Colors.white70,
                          ),
                          Text(
                            'Offers',
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.white : Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          navigatorKey.currentState!.maybePop();
                          currentScreen = const Chat1();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            color:
                                currentTab == 2 ? Colors.white : Colors.white70,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.white : Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          navigatorKey.currentState!.maybePop();
                          currentScreen = const UserAccount();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color:
                                currentTab == 3 ? Colors.white : Colors.white70,
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.white : Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardOpen?const SizedBox(): FloatingActionButton(
            elevation: 2.0,
            backgroundColor: AppColors.kPrimaryColor,
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                navigatorKey.currentState!.maybePop();
                currentScreen = const QRGenerator();
                currentTab = 4;
              });
            },
          ),


    );
  }
}

