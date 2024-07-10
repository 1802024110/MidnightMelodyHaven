import 'package:flutter/material.dart';

enum DeviceType { Mobile, PC, UltraWide }

DeviceType getDeviceType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return DeviceType.Mobile;
  } else if (width < 1200) {
    return DeviceType.PC;
  } else {
    return DeviceType.UltraWide;
  }
}
