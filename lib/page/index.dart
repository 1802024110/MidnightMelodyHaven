import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midnight_melody_haven/utils/device.dart';
import 'package:midnight_melody_haven/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenutil;

class IndexPage extends ConsumerStatefulWidget {
  const IndexPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen', style: TextStyle(fontSize: 24.0.sp)),
        ),
        body: Center(
          child: Text('Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24.0.sp)),
        ),
        bottomNavigationBar: getDeviceType(context) == DeviceType.Mobile
            ? const BottomNavigation()
            : null,
      ),
    );
  }
}
