import 'dart:developer';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:music_parrot/controllers/scales_controller.dart';

import '../constants/constants.dart';

class ParroterController extends GetxController {
  final controller = Get.put(ScalesController());
  final _random = Random();

  List<Map<String, dynamic>> melody = [];
  var times = [250, 500, 1000];

  List<int> melodySequence = [];
  var playerMelodySequence = [].obs;
  var playerSequenceIndex = 0;
  var sequenceLength = 9999;
  var showWinAnimation = false.obs;

  @override
  void onInit() {
    super.onInit();
    playerMelodySequence.listen((p0) async {
      if (listEquals(playerMelodySequence, melodySequence) &&
          melodySequence.isNotEmpty) {
        print("GANASTE!");
        showWinAnimation.value = true;
        await Future.delayed(Duration(milliseconds: 2000));
        showWinAnimation.value = false;
      }
    });
  }

  void playSong() {
    isPlaying.value = !isPlaying.value;
  }

  var isPlaying = false.obs;

  void createMelody() {
    melody.clear();
    melodySequence.clear();
    playerMelodySequence.clear();
    playerSequenceIndex = 0;
    sequenceLength = _random.nextInt(5) + 2;
    for (var i = 0; i < sequenceLength; i++) {
      Tone element = controller.currentScale
          .value[_random.nextInt(controller.currentScale.value.length)].value;
      melody.add(
          {'duration': times[_random.nextInt(times.length)], 'tone': element});
      melodySequence.add(element.number);
      playerMelodySequence.add(0);
    }
    playSong();
  }

  void handlePlayerSequence(number) {
    if (melodySequence.isNotEmpty) {
      if (playerSequenceIndex > playerMelodySequence.length - 1) {
        playerSequenceIndex = 0;
      }
      if (melodySequence[playerSequenceIndex] == number) {
        playerMelodySequence[playerSequenceIndex] = number;
        playerSequenceIndex += 1;
      } else {
        playerMelodySequence.value =
            playerMelodySequence.map((element) => element = 0).toList();
        playerSequenceIndex = 0;
      }
      print(playerMelodySequence);
      print(melodySequence);
      print(playerSequenceIndex);
    }
  }

  void repeat() {
    playSong();
  }
}
