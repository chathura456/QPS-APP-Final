import 'package:flutter/material.dart';
import 'package:qps_rider/screens/owner/features/bus_manager/bus_manager.dart';
import '/screens/screens.dart';
import '/widgets/my_widgets.dart';

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
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, tabItem)};
  }

  Widget _selectHome(BuildContext context){
    switch(type){
      case 'conductor':
        return const ConductorHome();
      case 'owner':
        return const OwnerHome();
      case 'seller':
        return const SellerHome();
      default:
        return const ConductorHome();
    }

  }

  Widget _selectFloating(BuildContext context){
    switch(type){
      case 'conductor':
        return const QRGenerator();
      case 'owner':
        return const BusManager();
      case 'seller':
        return const CreateAd();
      default:
        return const QRGenerator();
    }

  }

  Widget _getScreen(BuildContext context, TabItem item) {
    switch (item) {
      case TabItem.home:
        return _selectHome(context);
      case TabItem.chat:
        return const Chat1();
      case TabItem.profile:
        return const UserAccount();
      case TabItem.offers:
        return const Offers1();
      case TabItem.center:
        return _selectFloating(context);
      default:
        return const ConductorHome();
    }
  }
}
