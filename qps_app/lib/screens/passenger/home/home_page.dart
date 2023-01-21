import 'package:flutter/material.dart';
import '../../../widgets/my_widgets.dart';
import '../../screens.dart';

class PassengerHome extends StatefulWidget {
  const PassengerHome({Key? key}) : super(key: key);

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome>
    with AutomaticKeepAliveClientMixin {
  var currentPage = DrawerSections.home1;
  final GlobalKey<ScaffoldState> _key =
      GlobalKey<ScaffoldState>(debugLabel: '_homescreenkey');
  final int balance = 100;

  @override
  build(context) {
    super.build(context);
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
                '$balance LKR',
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
                  const DrawerHeader1(),
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
                            children: [
                              const MyListTiles(
                                  text: 'Edit\n Profile',
                                  iconData: Icons.manage_accounts,
                                  nextScreen: EditProfile()),
                              MyListTiles(
                                  text: 'Ticket\n Packages',
                                  iconData: Icons.confirmation_number,
                                  nextScreen: TicketPackages(balance: balance,)),
                              const MyListTiles(
                                  text: 'Bus\n Schedules',
                                  iconData: Icons.event_note,
                                  nextScreen: BusSchedules()),
                              const MyListTiles(
                                  text: 'Live\n Tracker',
                                  iconData: Icons.place,
                                  nextScreen: LiveTracker()),
                              const MyListTiles(
                                  text: 'Ads\n Section',
                                  iconData: Icons.shop_2,
                                  nextScreen: AdsSection()),
                              const MyListTiles(
                                  text: 'Payment\n History',
                                  iconData: Icons.history,
                                  nextScreen: PaymentHistory()),
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
                MaterialPageRoute(builder: (context) => const PassengerHome()));
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
            logout(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));

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
    //await FirebaseAuth.instance.signOut();
    /*Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=> LoginScreen())
    );*/
  }

  @override
  bool get wantKeepAlive => true;
}

enum DrawerSections { home1, profile, report, settings, contact, about, logout }
