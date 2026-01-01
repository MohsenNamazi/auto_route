import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/router/app_router.dart';

@RoutePage()
class SearchTabWrapperPage extends StatelessWidget {
  const SearchTabWrapperPage({super.key});
  @override
  Widget build(BuildContext context) => const AutoRouter();
}

@RoutePage()
class SearchTabPage extends StatelessWidget {
  const SearchTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.push(RouteARoute(
                  title: 'Screen A',
                  description: 'Opened from Search tab - A',
                ));
              },
              child: const Text('Open Screen A'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(RouteARoute(
                  title: 'Screen B',
                  description: 'Opened from Search tab - B',
                ));
              },
              child: const Text('Open Screen B'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(RouteARoute(
                  title: null,
                  description: null,
                ));
              },
              child: const Text('Open Screen C'),
            ),
          ],
        ),
      ),
    );
  }
}
