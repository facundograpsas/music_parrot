import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';

import 'controllers/scales_controller.dart';

class NotePlayer extends StatefulWidget {
  const NotePlayer({Key? key}) : super(key: key);

  @override
  State<NotePlayer> createState() => _NotePlayerState();
}

class _NotePlayerState extends State<NotePlayer> {
  final controller = Get.put(ScalesController());
  final _flutterMidi = FlutterMidi();

  @override
  void initState() {
    load('assets/sf2/miinstrumento-1.sf2');

    controller.currentScale.listen((p0) {
      for (var note in p0) {
        note.listen((p0) {
          if (p0!.isPlaying) {
            _play(p0.number);
          } else {
            _stop(p0.number);
          }
        });
      }
    });
    super.initState();
  }

  void _play(int midi) {
    _flutterMidi.playMidiNote(midi: midi);
  }

  void _stop(int midi) {
    _flutterMidi.stopMidiNote(midi: midi);
  }

  void load(String asset) async {
    _flutterMidi.unmute();
    ByteData byte = await rootBundle.load(asset);
    _flutterMidi.prepare(sf2: byte);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
