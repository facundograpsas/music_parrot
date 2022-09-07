import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:music_parrot/screens/game_screen.dart';
import 'package:music_parrot/screens/lets_parrot_screen.dart';
import 'package:music_parrot/screens/levels_screen.dart';
import 'package:music_parrot/theme.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music Parrot',
      theme: Themes.lightTheme,
      home: const MyHomePage(title: 'Music Parrot'),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const MyHomePage(
                  title: "Mmumu parrot!",
                )),
        GetPage(
            name: '/levels',
            page: () => const LevelsPage(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 400)),
        GetPage(
          name: '/game_screen',
          page: () => const GameScreen(),
          // transition: Transition.fadeIn,
          // transitionDuration: const Duration(milliseconds: 400)
        ),
        GetPage(
          name: '/lets_parrot_screen',
          page: () => const LetsParrotScreen(),
          // transition: Transition.fadeIn,
          // transitionDuration: const Duration(milliseconds: 400)
        ),
      ],
    );
  }
}
