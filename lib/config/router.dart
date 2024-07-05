import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_melody_haven/gen/asstes/assets.gen.dart';
import 'package:midnight_melody_haven/page/home/index.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => FlutterSplashScreen.fadeIn(
          backgroundColor: const Color.fromARGB(255, 235, 228, 228),
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Assets.images.start.image(),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const HomePage(),
          asyncNavigationCallback: () async =>
              GoRouter.of(context).goNamed("/home")),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    )
  ],
);
