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
  static Map notesList2 = {
    'C': Tone('C', 60, false),
    'C#': Tone('C#', 61, false),
    'Db': Tone('Db', 61, false),
    'D': Tone('D', 62, false),
    'D#': Tone('D#', 63, false),
    'Eb': Tone('Eb', 63, false),
    'E': Tone('c', 64, false),
    'F': Tone('c', 65, false),
    'F#': Tone('c', 66, false),
    'Gb': Tone('c', 66, false),
    'G': Tone('c', 67, false),
    'G#': Tone('c', 68, false),
    'Ab': Tone('c', 68, false),
    'A': Tone('c', 69, false),
    'A#': Tone('c', 70, false),
    'Bb': Tone('c', 70, false),
    'B': Tone('c', 71, false),
    'C2': Tone('c', 72, false)
  };

  static Map toneMap = {
    'C': 60,
    'C#/Db': 61,
    'D': 62,
    'D#/Eb': 63,
    'E': 64,
    'F': 65,
    'F#/Gb': 66,
    'G': 67,
    'G#/Ab': 68,
    'A': 69,
    'A#/Bb': 70,
    'B': 71,
  };

  static List<Map> toneList =
      toneMap.entries.map((e) => {e.key: e.value}).toList();
}

class Scales {
  static List<String> scalesNames = [
    'C Major',
    'C minor',
    'C minor pentatonic'
  ];

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

  static List<int> majorPattern = [2, 2, 1, 2, 2, 2, 1];

  static List<Tone?> cMinor = [
    Tones.notesList2['C'],
    Tones.notesList2['D'],
    Tones.notesList2['Eb'],
    Tones.notesList2['F'],
    Tones.notesList2['G'],
    // Tones.notesList2['Ab'],
    // Tones.notesList2['Bb'],
    // Tones.notesList2['C2'],
  ];
}

class Tone {
  final String note;
  final int number;
  bool isPlaying;
  Tone(this.note, this.number, this.isPlaying);
}
