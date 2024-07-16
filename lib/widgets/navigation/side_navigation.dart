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
          SideBarItem(),
          Row(children: [
            Container(
              width: 3,
              //高度填充完
              height: 10,
              color: Colors.blue,
            ),
            Expanded(child: ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('安全'),
              onTap: () {
                // 更新主页的逻辑
              },
            ))
          ],)
        ],
      ),
    );
  }

  Row SideBarItem() {
    return Row(children: [
          Container(
            width: 3,
            //高度填充完
            height: 10,
           color: Colors.blue,
          ),
          Expanded(child: ListTile(
            leading: Icon(Icons.home),
            title: Text('首页'),
            onTap: () {
              // 更新主页的逻辑
            },
          ))
        ],);
  }
}
