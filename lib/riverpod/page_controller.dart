import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_controller.g.dart';

@riverpod
Raw<PageController> mainPageController(MainPageControllerRef ref) {
  return PageController();
}

@riverpod
int selectedPageIndex  (SelectedPageIndexRef ref) => 0; // 初始选中首页
