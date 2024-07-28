import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midnight_melody_haven/widgets/media/my_video_play.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 一个视频播放器垫底，其它控件浮在它上面
        Positioned.fill(
          child: MyVideoPlay(),
        ),
        Positioned.fill(
          child: Container(color: Colors.transparent),
        )
      ],
    );
  }
}
