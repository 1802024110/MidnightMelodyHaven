import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:midnight_melody_haven/config/color_scheme.dart';
import 'package:midnight_melody_haven/config/router.dart';
import 'package:media_kit/media_kit.dart';                      // Provides [Player], [Media], [Playlist] etc.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('zh', 'CN')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 移除掉原生启动画面
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
        designSize: ScreenUtil().deviceType(context) == DeviceType.mobile
            ? Size(430, 932)
            : Size(720, 1140),
        child: MaterialApp.router(
          theme: FlexThemeData.light(colors: MyColorScheme.light),
          darkTheme: FlexThemeData.dark(colors: MyColorScheme.dark),
          routerConfig: router,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
        ));
  }
}
