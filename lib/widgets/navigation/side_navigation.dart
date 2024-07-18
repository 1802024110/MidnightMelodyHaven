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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(
              child: Text(
                '登录',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarItem extends HookConsumerWidget{
  final String title;
  final Widget icon;
  final bool isSelected;
  final int pageIndex;

  const SideBarItem( {super.key, required this.title, required this.icon, required this.pageIndex,required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {
    var  pageController = ref.watch(mainPageControllerProvider);

    return GestureDetector(
      child: Row(
        children: [
          AnimatedContainer(
            width: isSelected ? 3 : 0, // 宽度根据选中状态变化
            height: 40, // 固定高度
            color: Colors.blue,
            duration: Duration(milliseconds: 300), // 动画时长
          ),
          Expanded(
            child: ListTile(
              leading: icon,
              title: Text(title),
                onTap: ()=>pageController.jumpToPage(pageIndex), // 添加点击事件
            ),
          ),
        ],
      ),
    );
  }
}
