// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartTabPage(),
      );
    },
    CartTabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartTabWrapperPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTabPage(),
      );
    },
    HomeTabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTabWrapperPage(),
      );
    },
    LikesTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LikesTabPage(),
      );
    },
    LikesTabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LikesTabWrapperPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavigationPage(),
      );
    },
    ProfileTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabPage(),
      );
    },
    ProfileTabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabWrapperPage(),
      );
    },
    RouteARoute.name: (routeData) {
      final args = routeData.argsAs<RouteARouteArgs>(
          orElse: () => const RouteARouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenAPage(
          key: args.key,
          title: args.title,
          description: args.description,
        ),
      );
    },
    RouteBRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBPage(),
      );
    },
    RouteCRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCPage(),
      );
    },
    SearchTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchTabPage(),
      );
    },
    SearchTabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchTabWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [CartTabPage]
class CartTabRoute extends PageRouteInfo<void> {
  const CartTabRoute({List<PageRouteInfo>? children})
      : super(
          CartTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartTabWrapperPage]
class CartTabWrapperRoute extends PageRouteInfo<void> {
  const CartTabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          CartTabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartTabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTabPage]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTabWrapperPage]
class HomeTabWrapperRoute extends PageRouteInfo<void> {
  const HomeTabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LikesTabPage]
class LikesTabRoute extends PageRouteInfo<void> {
  const LikesTabRoute({List<PageRouteInfo>? children})
      : super(
          LikesTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikesTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LikesTabWrapperPage]
class LikesTabWrapperRoute extends PageRouteInfo<void> {
  const LikesTabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          LikesTabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikesTabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabPage]
class ProfileTabRoute extends PageRouteInfo<void> {
  const ProfileTabRoute({List<PageRouteInfo>? children})
      : super(
          ProfileTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabWrapperPage]
class ProfileTabWrapperRoute extends PageRouteInfo<void> {
  const ProfileTabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProfileTabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenAPage]
class RouteARoute extends PageRouteInfo<RouteARouteArgs> {
  RouteARoute({
    Key? key,
    String? title,
    String? description,
    List<PageRouteInfo>? children,
  }) : super(
          RouteARoute.name,
          args: RouteARouteArgs(
            key: key,
            title: title,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteARoute';

  static const PageInfo<RouteARouteArgs> page = PageInfo<RouteARouteArgs>(name);
}

class RouteARouteArgs {
  const RouteARouteArgs({
    this.key,
    this.title,
    this.description,
  });

  final Key? key;

  final String? title;

  final String? description;

  @override
  String toString() {
    return 'RouteARouteArgs{key: $key, title: $title, description: $description}';
  }
}

/// generated route for
/// [ScreenBPage]
class RouteBRoute extends PageRouteInfo<void> {
  const RouteBRoute({List<PageRouteInfo>? children})
      : super(
          RouteBRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteBRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenCPage]
class RouteCRoute extends PageRouteInfo<void> {
  const RouteCRoute({List<PageRouteInfo>? children})
      : super(
          RouteCRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteCRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchTabPage]
class SearchTabRoute extends PageRouteInfo<void> {
  const SearchTabRoute({List<PageRouteInfo>? children})
      : super(
          SearchTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchTabWrapperPage]
class SearchTabWrapperRoute extends PageRouteInfo<void> {
  const SearchTabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SearchTabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchTabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
