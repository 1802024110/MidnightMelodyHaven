import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:midnight_melody_haven/riverpod/page_controller.dart';

final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
  BottomNavigationBarItem(icon: Icon(TablerIcons.home), label: tr("home")),
  BottomNavigationBarItem(
      icon: Icon(TablerIcons.category), label: tr("categorization")),
  BottomNavigationBarItem(
      icon: Icon(TablerIcons.social), label: tr("social")),
  BottomNavigationBarItem(icon: Icon(TablerIcons.user), label: tr("mine"))
];
class BottomNavigation extends HookConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var  pageController = ref.watch(mainPageControllerProvider);
    var index = useState(0);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
      child: BottomNavigationBar(
        items: _bottomNavigationBarItem,
        currentIndex: index.value,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          pageController.jumpToPage(value);
          index.value = value;
        },
        // 导航栏的阴影大小
        elevation: 8,

        // 自定义选中项的图标主题
        selectedIconTheme: IconThemeData(
          size: 46.0.w, // 选中图标大小
        ),

        // 自定义未选中项的图标主题
        unselectedIconTheme: IconThemeData(
          size: 44.0.w, // 未选中图标大小
        ),

        // 自定义选中项的文字样式
        selectedLabelStyle: TextStyle(
          fontSize: 28.0.sp, // 选中文字大小
          fontWeight: FontWeight.bold, // 文字加粗
        ),

        // 自定义未选中项的文字样式
        unselectedLabelStyle: TextStyle(
          fontSize: 26.0.sp, // 未选中文字大小
        ),
      ),
    );
  }
}


