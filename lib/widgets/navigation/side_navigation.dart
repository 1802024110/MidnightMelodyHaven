import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    const double iconSize = 24.0;

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
          ListTile(
            title: Text('首页'),
            onTap: () {
              // 更新主页的逻辑
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('分类'),
            onTap: () {
              // 更新分类页
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('社交'),
            onTap: () {
              // 更新社交页
            },
            trailing: Icon(Icons.live_tv, color: Colors.red),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('我的'),
            onTap: () {
              // 更新我的页
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('个人资料'),
            onTap: () {
              // 更新个人资料页
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            onTap: () {
              // 更新设置页
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('退出'),
            onTap: () {
              // 处理退出逻辑
            },
          ),
        ],
      ),
    );
  }
}
