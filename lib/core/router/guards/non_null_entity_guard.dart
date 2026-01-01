import 'package:auto_route/auto_route.dart';

/// Guards routes that require non-null title/description.
///
/// If either is null, navigation is cancelled and the router pops.
class NonNullEntityGuard extends AutoRouteGuard {
  const NonNullEntityGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final args = resolver.route.args;
    final title = (args as dynamic).title as String?;
    final description = (args as dynamic).description as String?;

    if (title != null && description != null) {
      resolver.next(true);
    } else {
      router.popForced();
    }
  }
}
