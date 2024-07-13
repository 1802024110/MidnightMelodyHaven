import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midnight_melody_haven/page/category/index.dart';
import 'package:midnight_melody_haven/page/home/index.dart';
import 'package:midnight_melody_haven/page/mine/index.dart';
import 'package:midnight_melody_haven/page/social/index.dart';
import 'package:midnight_melody_haven/utils/device.dart';
import 'package:midnight_melody_haven/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenutil;
import 'package:midnight_melody_haven/widgets/navigation/side_navigation.dart';

class IndexPae extends ConsumerWidget {
  const IndexPae({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          body: Row(
            children: [
              if (getDeviceType(context) != DeviceType.Mobile) SideNavigation(),
              Expanded(
                child: PageView(
                  // scrollDirection: Axis.horizontal,
                  // reverse: false,
                  // pageSnapping: true,
                  // physics: ClampingScrollPhysics(),
                  // onPageChanged: (index) {
                  //   print("------$index");
                  // },
                  // controller: pageController,
                  allowImplicitScrolling: true,
                  children: const [
                    HomePage(),
                    CategoryPage(),
                    SocialPage(),
                    MinePage()
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: getDeviceType(context) == DeviceType.Mobile
              ? BottomNavigation()
              : null),
    );
  }
}
