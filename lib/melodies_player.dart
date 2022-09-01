import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:music_parrot/constants/colors_constants.dart';

class MelodiesPlayer extends StatefulWidget {
  const MelodiesPlayer({Key? key}) : super(key: key);

  @override
  State<MelodiesPlayer> createState() => _MelodiesPlayerState();
}

class _MelodiesPlayerState extends State<MelodiesPlayer> {
  final controller = Get.put(MelodiesPlayerController());
  final _flutterMidi = FlutterMidi();

  @override
  void initState() {
    load('assets/sf2/miinstrumento-1.sf2');

    // controller.c.listen((val) {
    //   if (val) {
    //     _play(60);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 60);
    //   }
    // });

    for (var element in controller.notes) {
      element.listen((note) {
        if (note.isPlaying) {
          _play(note.number);
        } else {
          _flutterMidi.stopMidiNote(midi: note.number);
        }
      });
    }

    // controller.d.listen((val) {
    //   if (val) {
    //     _play(62);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 62);
    //   }
    // });

    // controller.e.listen((val) {
    //   if (val) {
    //     _play(64);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 64);
    //   }
    // });

    // controller.f.listen((val) {
    //   if (val) {
    //     _play(65);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 65);
    //   }
    // });

    // controller.g.listen((val) {
    //   if (val) {
    //     _play(67);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 67);
    //   }
    // });

    // controller.a.listen((val) {
    //   if (val) {
    //     _play(69);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 69);
    //   }
    // });

    // controller.b.listen((val) {
    //   if (val) {
    //     _play(71);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 71);
    //   }
    // });

    // controller.c2.listen((val) {
    //   if (val) {
    //     _play(72);
    //   } else {
    //     _flutterMidi.stopMidiNote(midi: 72);
    //   }
    // });

    super.initState();
  }

  void _play(int midi) {
    if (false) {
      // WebMidi.play(midi);
    } else {
      _flutterMidi.playMidiNote(midi: midi);
    }
  }

  void load(String asset) async {
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    _flutterMidi.prepare(sf2: _byte);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MelodiesPlayerController extends GetxController {
  // final play = false.obs;
  // final c = false.obs;
  // final d = false.obs;
  // final e = false.obs;
  // final f = false.obs;
  // final g = false.obs;
  // final a = false.obs;
  // final b = false.obs;
  // final c2 = false.obs;

  var notes = [...Tones.notesList.map((e) => e.obs)];
}
