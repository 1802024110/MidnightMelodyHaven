import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_controller.g.dart';

@riverpod
Raw<PageController> mainPageController(MainPageControllerRef ref) {
  return PageController();
}

