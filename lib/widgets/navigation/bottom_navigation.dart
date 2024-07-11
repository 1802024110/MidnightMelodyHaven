import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.user), label: 'Profile1'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.user), label: 'Profile2'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.user), label: 'Profile3')
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _bottomNavigationBarItem,
      currentIndex: 0,
      onTap: (value) {},
      type: BottomNavigationBarType.shifting,
      // 自定义选中项的颜色
      selectedItemColor: const Color.fromARGB(255, 117, 193, 255),

      // 自定义未选中项的颜色
      unselectedItemColor: const Color.fromARGB(255, 27, 27, 27),
      // 导航栏的背景颜色
      backgroundColor: Colors.white,

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
    );
  }
}
