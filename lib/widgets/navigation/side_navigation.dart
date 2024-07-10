import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideNavigation extends ConsumerStatefulWidget {
  const SideNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideNavigationState();
}

class _SideNavigationState extends ConsumerState<SideNavigation> {
  @override
  Widget build(BuildContext context) {
    return const Text('SideNavigation');
  }
}
