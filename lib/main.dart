import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertmdb/common/get_it_module.dart' as get_it;
import 'package:fluttertmdb/ui/routing/router.dart';
import 'package:fluttertmdb/ui/utils/theme_utils.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'common/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_it.init());
  if (!kIsWeb) {
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux) {
      // Initialize FFI
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MyApp(savedThemeMode));
}

class MyApp extends StatelessWidget {
  AdaptiveThemeMode? savedThemeMode;

  MyApp(this.savedThemeMode, {super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeUtils.lightTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        dark: ThemeUtils.darkTheme,
        builder: (ThemeData light, ThemeData dark) {
          return MaterialApp.router(
              theme: light,
              darkTheme: dark,
              debugShowCheckedModeBanner: false,
              title: 'TMDB App',
              routerConfig: tmdbRoutes);
        });
  }
}
