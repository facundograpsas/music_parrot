import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:music_parrot/controllers/parroter_controller.dart';
import 'controllers/instrument_controller.dart';
import 'controllers/scales_controller.dart';

class NotePlayer extends StatefulWidget {
  const NotePlayer({Key? key}) : super(key: key);

  @override
  State<NotePlayer> createState() => _NotePlayerState();
}

class _NotePlayerState extends State<NotePlayer> {
  final controller = Get.put(ScalesController());
  final icontroller = Get.put(InstrumentController());

  final parroterController = Get.put(ParroterController());

  final _flutterMidi = FlutterMidi();

  final _random = new Random();
  var times = [250, 500, 1000];

  @override
  void initState() {
    load(icontroller.currentInstrument.value!);

    controller.currentScale.listen((p0) {
      for (var note in p0) {
        note.listen((p0) {
          if (p0!.isPlaying) {
            _play(p0.number);
            parroterController.handlePlayerSequence(p0.number);
          } else {
            _stop(p0.number);
          }
        });
      }
    });

    icontroller.currentInstrument.listen((p0) {
      load(p0!);
    });

    parroterController.isPlaying.listen((p0) {
      createMelodie();
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

  void createMelodie() async {
    for (var element in parroterController.melody) {
      _flutterMidi.playMidiNote(midi: element['tone'].number);
      await Future.delayed(Duration(milliseconds: element['duration']));
      _flutterMidi.stopMidiNote(midi: element['tone'].number);
    }
  }
}
