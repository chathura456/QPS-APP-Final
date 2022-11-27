import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key, required this.onSelectTab}) : super(key: key);
  final ValueChanged<TabItem> onSelectTab;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2.0,
      color: AppColors.kPrimaryColor,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.onSelectTab(
                        TabItem.values[0],
                      );
                      currentTab = 0;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.white : Colors.white70,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color:
                              currentTab == 0 ? Colors.white : Colors.white70,
                        ),
                      ),
                      //buildTabItem(0, const Icon(Icons.home)),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.onSelectTab(
                        TabItem.values[1],
                      );
                      currentTab = 1;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //buildTabItem(1, const Icon(Icons.search)),
                      Icon(
                        Icons.discount,
                        color: currentTab == 1 ? Colors.white : Colors.white70,
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
                  onPressed: () {
                    setState(() {
                      widget.onSelectTab(
                        TabItem.values[2],
                      );
                      currentTab = 2;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //buildTabItem(2, const Icon(Icons.chat)),
                      Icon(
                        Icons.chat,
                        color: currentTab == 2 ? Colors.white : Colors.white70,
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
                  onPressed: () {
                    setState(() {
                      currentTab = 3;
                      widget.onSelectTab(
                        TabItem.values[3],
                      );
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // buildTabItem(3, const Icon(Icons.person)),
                      Icon(
                        Icons.account_circle,
                        color: currentTab == 3 ? Colors.white : Colors.white70,
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
    );
  }
}

enum TabItem {
  home,
  offers,
  chat,
  profile,
}
