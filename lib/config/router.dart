import 'package:go_router/go_router.dart';
import 'package:midnight_melody_haven/page/index.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IndexPage(),
    ),
  ],
);
