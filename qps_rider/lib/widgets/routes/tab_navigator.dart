import 'package:flutter/material.dart';
import 'package:qps_rider/screens/owner/owner_home.dart';
import '/screens/screens.dart';
import '/widgets/my_widgets.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class CustomRouter {
  static Route onGenerateNestedRoute(RouteSettings settings) {
    print('NestedRoute: ${settings.name}');
    switch (settings.name) {
      case HomePageSelect.routeName:
        return MaterialPageRoute(builder: (context) => const HomePageSelect());
      case UserProfile.routeName:
        return MaterialPageRoute(builder: (context) => const UserProfile());
      default:
        return MaterialPageRoute(builder: (context) => const HomePageSelect());
    }
  }
}

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';
  const TabNavigator({Key? key, this.navigatorKey, required this.tabItem, required this.type})
      : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
  final String type;

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
              settings: const RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute]!(context)),
        ];
      },
      onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, tabItem)};
  }

  Widget _selecthome(BuildContext context){
    switch(type){
      case 'conductor':
        return const ConductorHome();
      case 'owner':
        return const OwnerHome();
      case 'seller':
        return const ConductorHome();
      default:
        return const ConductorHome();
    }

  }

  Widget _getScreen(BuildContext context, TabItem item) {
    switch (item) {
      case TabItem.home:
        return _selecthome(context);
      case TabItem.chat:
        return const Chat1();
      case TabItem.profile:
        return const UserAccount();
      case TabItem.offers:
        return const Offers1();
      case TabItem.center:
        return const QRGenerator();
      default:
        return const ConductorHome();
    }
  }
}
