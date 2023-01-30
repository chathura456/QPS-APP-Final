import 'package:flutter/material.dart';
import 'package:qps_rider/screens/owner/features/bus_manager/bus_manager2.dart';
import 'package:qps_rider/screens/owner/features/owner_bus_tracking/owner_bus_tracking.dart';
import 'package:qps_rider/screens/owner/features/owner_dashboard/owner_dashboard.dart';
import '../../../widgets/my_widgets.dart';
import '../screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class OwnerHome extends StatefulWidget {
  const OwnerHome({Key? key}) : super(key: key);

  @override
  State<OwnerHome> createState() => _OwnerHomeState();
}

class _OwnerHomeState extends State<OwnerHome> with AutomaticKeepAliveClientMixin{
  var currentPage = DrawerSections.home1;
  final GlobalKey<ScaffoldState> _key =
  GlobalKey<ScaffoldState>(debugLabel: '_homescreenkey');
  User? user=FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();
  OwnerModel owner = const OwnerModel();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    final userNew = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColors.kPrimaryColorDark,
        child: SafeArea(
          //Appbar designs
          child: Scaffold(
            key: _key,
            appBar: AppBar(
              title: Text(
                //'1000 LKR',
                '${userNew?.points} LKR',
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_active),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const PushNotifications()));
                    },
                  ),
                ),
              ],
              backgroundColor: AppColors.kPrimaryColor,
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  DrawerHeader1(userID: 'BO - ${userNew?.uid}',userName: '${userNew?.name}',),
                  navList(),
                ],
              ),
            ),
            body: Container(
              color: AppColors.kPrimaryColor5,
              child: Column(
                children: [
                  Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: SizedBox(
                              //child: MySlider(),
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: double.infinity,
                              child: const MySlider(),
                            ),
                          )
                        ],
                      ),
                      //const SizedBox(height: 1,)
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomScrollView(
                      primary: false,
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(50, 15, 50, 40),
                          sliver: SliverGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 20,
                            children: const [
                              MyListTiles(
                                  text: 'Edit\n Profile',
                                  iconData: Icons.manage_accounts,
                                  nextScreen: EditProfile()),
                              MyListTiles(
                                  text: 'Owner\n Dashboard',
                                  iconData: Icons.dashboard,
                                  nextScreen: OwnerDashboard()),
                              MyListTiles(
                                  text: 'Bus\n Manager',
                                  iconData: Icons.directions_bus,
                                  nextScreen: BusManager2()),
                              MyListTiles(
                                  text: 'Live\n Tracker',
                                  iconData: Icons.add_location_alt,
                                  nextScreen: OwnerBusTracking()),
                              MyListTiles(
                                  text: 'Ads\n Section',
                                  iconData: Icons.tab,
                                  nextScreen: AdsSection()),
                              MyListTiles(
                                  text: 'Money\n Transfer',
                                  iconData: Icons.currency_exchange,
                                  nextScreen: MoneyTransfer()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.home1 ? true : false),
          menuItem(2, "Profile", Icons.account_circle,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(3, "Report Problem", Icons.report,
              currentPage == DrawerSections.report ? true : false),
          menuItem(4, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(5, "Contact us", Icons.call,
              currentPage == DrawerSections.contact ? true : false),
          menuItem(6, "About us", Icons.info,
              currentPage == DrawerSections.about ? true : false),
          const SizedBox(
            height: 50,
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: AppColors.kPrimaryColor10,
          ),
          menuItem(7, "LogOut", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return InkWell(
      onTap: () {
        _key.currentState?.openEndDrawer();
        switch (id) {
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OwnerHome()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserProfile()));
            break;
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReportProblem()));
            break;
          case 4:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AppSettings()));
            break;
          case 5:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUs()));
            break;
          case 6:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUs()));
            break;
          case 7:
            //logout(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
           /* Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));*/
          logout(context);

            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 25,
                color: AppColors.kPrimaryColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  bool get wantKeepAlive => true;
}


