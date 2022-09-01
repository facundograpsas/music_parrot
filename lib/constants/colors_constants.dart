import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Dark Theme colors
  static const Color darkGrey = Color(0xff303041);
  static const Color lightGrey = Color(0xFF3D3A50);
  static const Color white = Color(0xFF0EA2F6);
  static const Color burgundy = Color(0xFF880d1e);
  static const Color spaceCadet = Color(0xFFF4FCFE);

  // Light Theme Colors
  // static const Color babyGreen = Color.fromARGB(255, 217, 250, 173);
  // static const Color cakeGreen = Color.fromARGB(255, 191, 236, 189);
  // static const Color parrotGreen = Color.fromARGB(255, 42, 214, 42);
  // static const Color cakeYellow = Color.fromARGB(255, 249, 255, 169);
  // static const Color darkGreen = Color.fromARGB(255, 0, 155, 13);
}

class Tones {
  static List<Tone> notesList = [
    Tone('c', 60, false),
    Tone('d', 62, false),
    Tone('e', 64, false),
    Tone('f', 65, false),
    Tone('g', 67, false),
    Tone('a', 69, false),
    Tone('b', 71, false),
    Tone('c', 72, false),
  ];

  static Map notesList2 = {
    'C': Tone('c', 60, false),
    'D': Tone('c', 62, false),
    'E': Tone('c', 64, false),
    'F': Tone('c', 65, false),
    'G': Tone('c', 67, false),
    'A': Tone('c', 69, false),
    'B': Tone('c', 71, false),
    'C2': Tone('c', 72, false)
  };
}

class Scales {
  static List<Tone?> cMajor = [
    Tones.notesList2['C'],
    Tones.notesList2['D'],
    Tones.notesList2['E'],
    Tones.notesList2['F'],
    Tones.notesList2['G'],
    Tones.notesList2['A'],
    Tones.notesList2['B'],
    Tones.notesList2['C2'],
  ];
}

class Tone {
  final String note;
  final int number;
  bool isPlaying;
  Tone(this.note, this.number, this.isPlaying);
}
