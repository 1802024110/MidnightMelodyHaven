import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midnight_melody_haven/page/home/index.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
