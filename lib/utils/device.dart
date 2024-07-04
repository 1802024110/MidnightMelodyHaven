import 'package:flutter/material.dart';

String getDeviceType(BuildContext context) {
  var mediaQuery = MediaQuery.of(context);
  var screenSize = mediaQuery.size;
  if (screenSize.width < 600) {
    return 'Phone';
  } else if (screenSize.width < 1024) {
    return 'Tablet';
  } else {
    return 'Desktop';
  }
}
