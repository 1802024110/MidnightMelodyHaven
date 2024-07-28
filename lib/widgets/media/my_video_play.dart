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
    useEffect(() {
      player.value?.open(playerMedia);

      // Clean up the player when the widget is disposed
      return () {
        player.value?.dispose();
      };
    }, []);

    return Container(
      child: Video(controller: controller),
    );
  }
}
