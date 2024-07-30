import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MyVideoPlay extends HookConsumerWidget {
  const MyVideoPlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = useState<Player?>(Player());
    final controller = VideoController(player.value!);
    final playerMedia = Media(
        'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4');
    final aspectRatio = useState<double>(16 / 9); // Default aspect ratio
    final backgroundImage = useState<Uint8List?>(null);

    useEffect(() {
      player.value?.open(playerMedia).then((_) async {
        // 获取视频的宽高比
        if (player.value?.state.width != null &&
            player.value?.state.height != null) {
          aspectRatio.value =
              player.value!.state.width! / player.value!.state.height!;
        }

        // 获取视频的第一帧作为背景图像
        final frame = await player.value!.screenshot();
        backgroundImage.value = frame;
      });

      // Clean up the player when the widget is disposed
      return () {
        player.value?.dispose();
      };
    }, []);

    return Stack(
      children: [
        // 背景封面图片
        if (backgroundImage.value != null)
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Image.memory(
                backgroundImage.value!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.8),
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
        // 视频播放器
        Center(
          child: AspectRatio(
            aspectRatio: aspectRatio.value,
            child: Video(controller: controller),
          ),
        ),
      ],
    );
  }
}
