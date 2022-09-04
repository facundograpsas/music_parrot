class Tones {
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
  static Map<String, List<int>> scales = {
    'Major': majorPattern,
    'Minor': minorPattern
  };

  static List<int> majorPattern = [2, 2, 1, 2, 2, 2, 1];
  static List<int> minorPattern = [2, 1, 2, 2, 1, 2, 2];
}

class Tone {
  final String note;
  final int number;
  bool isPlaying;
  Tone(this.note, this.number, this.isPlaying);
}
