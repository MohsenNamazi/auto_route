import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/router/app_router.dart';

@RoutePage()
class ProfileTabWrapperPage extends StatelessWidget {
  const ProfileTabWrapperPage({super.key});
  @override
  Widget build(BuildContext context) => const AutoRouter();
}

@RoutePage()
class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.push(RouteARoute(
                  title: 'Screen A',
                  description: 'Opened from Profile tab - A',
                ));
              },
              child: const Text('Open Screen A'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.router.push(RouteARoute(
                  title: 'Screen B',
                  description: 'Opened from Profile tab - B',
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
