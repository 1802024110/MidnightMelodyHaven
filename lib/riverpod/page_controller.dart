import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@Riverpod(keepAlive: true)
class PageControllerNotifier extends StateNotifier<PageController> {
  PageControllerNotifier() : super(PageController());

  void jumpToPage(int page) {
    state.jumpToPage(page);
  }

  void nextPage({required Duration duration, required Curve curve}) {
    state.nextPage(duration: duration, curve: curve);
  }

  void previousPage({required Duration duration, required Curve curve}) {
    state.previousPage(duration: duration, curve: curve);
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
