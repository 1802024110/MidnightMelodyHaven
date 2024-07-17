import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideNavigation extends ConsumerStatefulWidget {
  const SideNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideNavigationState();
}

class _SideNavigationState extends ConsumerState<SideNavigation> {
  int selectedIndex = 0; // 添加selectedIndex变量

  final sideBarItems = [
    SideBarItem(
      title: '首页',
      icon: Icon(
        TablerIcons.home,
        color: Colors.black,
      ),
    ),
    SideBarItem(
      title: '我的',
      icon: Icon(
        TablerIcons.user,
        color: Colors.black,
      ),
    ),
  ];

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
          Text("当前索引：$selectedIndex"),
          ...sideBarItems.asMap().entries.map((entry) {
            int idx = entry.key;
            SideBarItem item = entry.value;
            return SideBarItemWidget(
              item: item,
              isSelected: selectedIndex == idx, // 传递是否选中状态
              onTap: () {
                setState(() {
                  selectedIndex = idx; // 更新选中的索引
                });
              },
            );
          }),
        ],
      ),
    );
  }
}

class SideBarItem {
  final String title;
  final Widget icon;

  const SideBarItem({required this.title, required this.icon});
}

class SideBarItemWidget extends StatelessWidget {
  final SideBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const SideBarItemWidget(
      {required this.item,
      required this.isSelected,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 添加点击事件
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
              leading: item.icon,
              title: Text(item.title),
              onTap: onTap, // 更新主页的逻辑
            ),
          ),
        ],
      ),
    );
  }
}
