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
    'Minor': minorPattern,
    'Lydian': lydianPattern,
    'Dorian': dorianPattern,
    'Mixolydian': mixolydianPattern,
    'Phrygian': phrygianPattern
  };

  static List<int> majorPattern = [2, 2, 1, 2, 2, 2, 1, 2];
  static List<int> minorPattern = [2, 1, 2, 2, 1, 2, 2, 2];
  static List<int> lydianPattern = [2, 2, 2, 1, 2, 2, 1, 2];
  static List<int> dorianPattern = [2, 1, 2, 2, 2, 1, 2, 2];
  static List<int> mixolydianPattern = [2, 2, 1, 2, 2, 1, 2, 2];
  static List<int> phrygianPattern = [1, 2, 2, 2, 1, 2, 2, 1];
}

class Tone {
  final String note;
  final int number;
  bool isPlaying;
  Tone(this.note, this.number, this.isPlaying);
}

class Instruments {
  static List<Map<String, String>> instruments = [
    {'name': '8-Bits', 'path': 'assets/sf2/8bits.sf2'},
    {'name': 'Super N', 'path': 'assets/sf2/superN.sf2'},
    {'name': 'Parrot', 'path': 'assets/sf2/parrot.sf2'},
  ];
}
