import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../riverpod/page_controller.dart';

class SideNavigation extends HookConsumerWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainPageController = ref.watch(mainPageControllerProvider);
    final selectIndex = useState(0);
    final scrollController = useScrollController(); // Use ScrollController

    const indicatorWidth = 6.0; // Define a constant for the indicator width

    final navigationItems = [
      NavigationItem(
        icon: Icon(TablerIcons.home),
        title: '首页'.tr(),
        selected: selectIndex.value == 0,
        pageIndex: 0,
      ),
      NavigationItem(
        icon: Icon(TablerIcons.search),
        title: '搜索'.tr(),
        selected: selectIndex.value == 1,
        pageIndex: 1,
      ),
      NavigationItem(
        icon: Icon(TablerIcons.heart),
        title: '收藏'.tr(),
        selected: selectIndex.value == 2,
        pageIndex: 2,
      ),
      NavigationItem(
        icon: Icon(TablerIcons.user),
        title: '我的'.tr(),
        selected: selectIndex.value == 3,
        pageIndex: 3,
      ),
    ];

    return Drawer(
      child: Column(
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
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                const fixedTileHeight =
                    60.0; // Fixed height for each navigation item
                const indicatorHeight =
                    fixedTileHeight * 0.6; // Red indicator bar height
                const topOffset = (fixedTileHeight - indicatorHeight) /
                    2; // Center the indicator

                return Stack(
                  children: [
                    // The red indicator bar with animation
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),

                      curve: Curves.easeInOut,
                      top: selectIndex.value * fixedTileHeight + topOffset,
                      left: - indicatorWidth,
                      child: Container(
                        height: indicatorHeight,
                        width: indicatorWidth * 2,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 62, 100, 252),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(indicatorWidth),
                            bottomRight: Radius.circular(indicatorWidth),
                          ),
                        ),
                      ),
                    ),
                    // List tiles
                    ListView.builder(
                      controller: scrollController,
                      itemCount: navigationItems.length,
                      itemBuilder: (context, index) {
                        final item = navigationItems[index];
                        return GestureDetector(
                          onTap: () {
                            mainPageController.jumpToPage(item.pageIndex);
                            selectIndex.value = item.pageIndex;
                          },
                          child: Container(
                            height: fixedTileHeight,
                            color: Color.fromARGB(0, 77, 181, 250),
                            padding: EdgeInsets.only(
                                left: indicatorWidth +
                                    6), // Use the same constant here
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: item),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 自定义导航项
class NavigationItem extends HookConsumerWidget {
  final Icon icon;
  final String title;
  final bool selected;
  final int pageIndex;

  const NavigationItem({
    required this.icon,
    required this.title,
    required this.selected,
    required this.pageIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10),
      // 添加蓝色到白色横向渐变背景
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const [
            Color.fromARGB(255, 203, 212, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
        // 左上角和左下角6像素圆角
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          bottomLeft: Radius.circular(36),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon.icon,
            color: selected ? Color.fromARGB(255, 228, 171, 99) : Colors.grey,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color:
                  selected ? Color.fromARGB(255, 228, 171, 99) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
