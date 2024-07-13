import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialPage extends ConsumerStatefulWidget {
  const SocialPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SocialPageState();
}

class _SocialPageState extends ConsumerState<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Text("社交");
  }
}
