import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  var _currentTab = TabItem.home;
  int tabId = 0;

  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.offers: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.center: GlobalKey<NavigatorState>(),
  };

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
          _buildOffstageNavigator(TabItem.center),

        ]),
        bottomNavigationBar: MyBottomBar(
         // onSelectTab: _selectTab, currentTab: _currentTab==TabItem.center?5:0,
          onSelectTab: _selectTab, currentTab:_selectNum(_currentTab),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.kPrimaryColor,
          elevation: 2.0,
          child: Icon(
            _middleIcon(),
            color: _currentTab==TabItem.center?Colors.white : Colors.white70,
            size: 30,
          ),
          onPressed: () => {
          setState(() {
            _selectTab(TabItem.center);
            tabId =5;
          })
            //Navigator.pushNamed(context, '/qr_generator'),
           /* Navigator.push(context,
                MaterialPageRoute(builder: (context) => const QRGenerator())),*/
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
  
  int _selectNum(TabItem item){
    switch (item) {
      case TabItem.home:
        return 0;
      case TabItem.offers:
        return 1;
      case TabItem.chat:
        return 2;
      case TabItem.profile:
        return 3;
      case TabItem.center:
        return 4;
    }
  }

  IconData _middleIcon(){
    IconData iconData;
    switch(widget.type){
      case 'conductor':
        iconData =Icons.qr_code_2;
        break;
      case 'owner':
        iconData =Icons.directions_bus;
        break;
      case 'seller':
        iconData=Icons.add_chart;
        break;
      default:
        iconData=Icons.qr_code_2;
        break;
    }
    return iconData;
  }

  Widget _buildOffstageNavigator(TabItem tabItem1) {
    return Offstage(
      offstage: _currentTab != tabItem1,
      child: TabNavigator(
        type: widget.type,
        navigatorKey: _navigatorKeys[tabItem1],
        tabItem: tabItem1,
      ),
    );
  }
}
