import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class MyBottomBar extends StatefulWidget {
  MyBottomBar({Key? key, required this.onSelectTab, required this.currentTab}) : super(key: key);
  final ValueChanged<TabItem> onSelectTab;
   int currentTab;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
 // int currentTab = 0;
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
                      widget.currentTab = 0;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: widget.currentTab == 0? Colors.white : Colors.white70,
                        //color: TabItem.values[0] == true ? Colors.white : Colors.white70,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color:
                          widget.currentTab == 0 ? Colors.white : Colors.white70,
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
                      widget.currentTab = 1;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //buildTabItem(1, const Icon(Icons.search)),
                      Icon(
                        Icons.discount,
                        color: widget.currentTab == 1 ? Colors.white : Colors.white70,
                      ),
                      Text(
                        'Offers',
                        style: TextStyle(
                          color: widget.currentTab == 1 ? Colors.white : Colors.white70,
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
                      widget.currentTab = 2;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //buildTabItem(2, const Icon(Icons.chat)),
                      Icon(
                        Icons.chat,
                        color: widget.currentTab == 2 ? Colors.white : Colors.white70,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                          color:
                          widget.currentTab == 2 ? Colors.white : Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.currentTab = 3;
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
                        color: widget.currentTab == 3 ? Colors.white : Colors.white70,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          color:
                          widget.currentTab == 3 ? Colors.white : Colors.white70,
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
  center
}
