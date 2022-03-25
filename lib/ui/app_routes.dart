import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const MAIN = '/main';
  static const ITEM = '/item';
  static const SEARCH_CATEGORY_SELECT = '/search/category_select';
  static const SEARCH_FILTER = '/search/filter';
  static const SERVICE_LIST_SELECTOR = '/service/list_selector';
  static const AUTH_PAGE = '/auth/index';

  static final _routes = <String, WidgetBuilder>{
    MAIN: (context) => MainPage(),
    ITEM: (context) => ItemPage(),
    SEARCH_CATEGORY_SELECT: (context) => CategorySelectPage(),
    SEARCH_FILTER: (context) => SearchFilterPage(),
    SERVICE_LIST_SELECTOR: (context) => ListSelectorPage(),
    AUTH_PAGE: (context) => LoginPanelPage(),
  };

  static Route<dynamic> generateRoute(
    RouteSettings settings,
    RouteObserver<PageRoute> routeObserver,
  ) {
    print('Navigate to ${settings.name}');
    WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();

    if (_routes[settings.name] == null)
      throw ArgumentError.value(settings.name);

    switch (settings.name) {
      case SEARCH_CATEGORY_SELECT:
      case SEARCH_FILTER:
      case AUTH_PAGE:
        return _generate(
          settings: settings,
          fullscreenDialog: true,
          builder: _routes[settings.name]!,
        );
    }

    return _generate(
      settings: settings,
      builder: _routes[settings.name]!,
    );
  }

  static PageRoute _generate({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: fullscreenDialog,
      builder: builder,
    );
  }
}
