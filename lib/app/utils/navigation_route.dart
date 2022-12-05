import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/app/global_imports.dart';
import 'package:flutter_mvvm/features/city_care/city_care_homepage.dart';
import '/features/counter/counter_homepage.dart';
import '/features/fresh_news/news_homepage.dart';
import '/homepage.dart';
import '/features/place_finder/place_finder_homepage.dart';

import '../widgets/page_not_found.dart';

enum ROUTES {
  home,
  news,
  counter,
  placeFinder,
  cityCare,
}

class NavigationRoute {
  static Map<String, Widget> routes = {
    ROUTES.news: const NewsHomePage(),
    ROUTES.home: const HomePage(),
    ROUTES.counter: const CounterHomePage(),
    ROUTES.placeFinder: const PlaceFinderHomepage(),
    ROUTES.cityCare: const CityCareHomePage(),
  }.map((key, value) => MapEntry<String, Widget>(key.tr, value));

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute<Object>(
          builder: (context) {
            return routes[settings.name] ?? const PageNotFound();
          },
          settings: settings);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute<Object>(
          builder: (context) {
            return routes[settings.name] ?? const PageNotFound();
          },
          settings: settings);
    } else {
      return PageRouteBuilder<Object>(
          pageBuilder: (context, animation, builder) {
            return routes[settings.name] ?? const PageNotFound();
          },
          settings: settings);
    }
  }

  static void goTo(BuildContext context, ROUTES route) {
    bool pageFound = false;
    String? page = '';
    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      if (modalRoute.settings.name == route.tr) {
        return;
      }
      //  debugPrint('Navigator.canPop:true   Navigator.popUntil() fired. Searching ${route.tr} page...');
      Navigator.popUntil(context, (newRoute) {
        page = newRoute.settings.name;
        pageFound = page == ROUTES.home.tr || (page ?? '') == route.tr;
        return pageFound;
      });
    }
    if (!pageFound || (page == ROUTES.home.tr && route != ROUTES.home)) {
      debugPrint('page [${route.tr}] not found in recent routes. routing the page..');
      //  Navigator.push(context, generateRoute(RouteSettings(name: route.tr)));
      Navigator.pushNamed(context, route.tr);
    } else {
      debugPrint('page [${route.tr}] found in recent routes.');
    }
  }

  static void goToWidget(BuildContext context, Widget widget, {bool isFullscreenDialog = false}) {
    //  Navigator.push(context, generateRoute(RouteSettings(name: route.tr)));
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget, fullscreenDialog: isFullscreenDialog));
  }
}
