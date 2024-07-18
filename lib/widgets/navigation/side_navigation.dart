import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../riverpod/page_controller.dart';

class SideNavigation extends ConsumerStatefulWidget {
  const SideNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideNavigationState();
}

class _SideNavigationState extends ConsumerState<SideNavigation> {
  @override
  Widget build(BuildContext context) {
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(
              child: Text(
                '登录',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
          ),
          // 在这里添加 SideBarItem 实例
          SideBarItem(
            title: '首页',
            icon: Icon(Icons.home),
            isSelected: selectedPageIndex == 0, // 根据状态设置 isSelected
            pageIndex: 0,
          ),
          SideBarItem(
            title: '设置',
            icon: Icon(Icons.settings),
            isSelected: selectedPageIndex == 1, // 根据状态设置 isSelected
            pageIndex: 1,
          ),
          // 添加更多 SideBarItem 实例...
        ],
      ),
    );
  }
}

class SideBarItem extends HookConsumerWidget {
  final String title;
  final Widget icon;
  final bool isSelected;
  final int pageIndex;

  const SideBarItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.pageIndex,
      required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(mainPageControllerProvider);
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);
    return GestureDetector(
      onTap: () {
        pageController.jumpToPage(pageIndex);
        ref.read(selectedPageIndexProvider.notifier).state =
            pageIndex; // 更新选中状态
      },
      child: Row(
        children: [
          AnimatedContainer(
            width: isSelected ? 10 : 0, // 增加宽度以使动画更明显
            // 高度填满
            height: 40,
            color: Colors.red, // 更改颜色以确保可见
            duration: Duration(milliseconds: 300), // 增加动画时长
            curve: Curves.easeInOut, // 添加动画曲线
          ),
          Expanded(
            child: ListTile(
              leading: icon,
              title: Text(title),
            ),
          ),
        ],
      ),
    );
  }
}
