import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../presentation/pages/main_navigation/main_navigation_page.dart';
import '../../presentation/pages/tabs/home_tab_page.dart';
import '../../presentation/pages/tabs/search_tab_page.dart';
import '../../presentation/pages/tabs/cart_tab_page.dart';
import '../../presentation/pages/tabs/likes_tab_page.dart';
import '../../presentation/pages/tabs/profile_tab_page.dart';
import '../../presentation/pages/screens/screen_a_page.dart';
import '../../presentation/pages/screens/screen_b_page.dart';
import '../../presentation/pages/screens/screen_c_page.dart';
import 'guards/non_null_entity_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  final _nullEntityGuard = const NonNullEntityGuard();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeTabWrapperRoute.page,
              initial: true,
              children: [
                AutoRoute(page: HomeTabRoute.page, initial: true),
                AutoRoute(
                  page: RouteARoute.page,
                  guards: [_nullEntityGuard],
                ),
              ],
            ),
            AutoRoute(
              page: SearchTabWrapperRoute.page,
              children: [
                AutoRoute(page: SearchTabRoute.page, initial: true),
                AutoRoute(
                  page: RouteARoute.page,
                  guards: [_nullEntityGuard],
                ),
              ],
            ),
            AutoRoute(
              page: CartTabWrapperRoute.page,
              children: [
                AutoRoute(page: CartTabRoute.page, initial: true),
                AutoRoute(
                  page: RouteARoute.page,
                  guards: [_nullEntityGuard],
                ),
              ],
            ),
            AutoRoute(
              page: LikesTabWrapperRoute.page,
              children: [
                AutoRoute(page: LikesTabRoute.page, initial: true),
                AutoRoute(
                  page: RouteARoute.page,
                  guards: [_nullEntityGuard],
                ),
              ],
            ),
            AutoRoute(
              page: ProfileTabWrapperRoute.page,
              children: [
                AutoRoute(page: ProfileTabRoute.page, initial: true),
                AutoRoute(
                  page: RouteARoute.page,
                  guards: [_nullEntityGuard],
                ),
              ],
            ),
          ],
        ),
      ];
}
