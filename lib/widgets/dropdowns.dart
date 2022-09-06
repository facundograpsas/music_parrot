import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/instrument_controller.dart';
import '../controllers/scales_controller.dart';

class ScalesDropDown extends StatefulWidget {
  const ScalesDropDown({super.key});

  @override
  State<ScalesDropDown> createState() => _ScalesDropDownState();
}

class _ScalesDropDownState extends State<ScalesDropDown> {
  final controller = Get.put(ScalesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
        value: controller.currentScalePattern.value,
        items: Scales.scales
            .map((scale, pattern) {
              return MapEntry(
                  scale,
                  DropdownMenuItem<List<int>>(
                      value: pattern, child: Text(scale)));
            })
            .values
            .toList(),
        onChanged: onChanged));
  }

  void onChanged(value) {
    controller.changeScale(value);
  }
}

class InstrumentsDropDown extends StatefulWidget {
  const InstrumentsDropDown({super.key});

  @override
  State<InstrumentsDropDown> createState() => _InstrumentsDropDownState();
}

class _InstrumentsDropDownState extends State<InstrumentsDropDown> {
  final controller = Get.put(InstrumentController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
        value: controller.currentInstrument.value,
        items: Instruments.instruments.map((e) {
          return DropdownMenuItem(value: e['path'], child: Text(e['name']!));
        }).toList(),
        onChanged: onChanged));
  }

  void onChanged(value) {
    controller.changeInstrument(value);
  }
}

class KeysDropDown extends StatefulWidget {
  const KeysDropDown({super.key});

  @override
  State<KeysDropDown> createState() => _KeysDropDownState();
}

class _KeysDropDownState extends State<KeysDropDown> {
  final controller = Get.put(ScalesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
        value: controller.currentKeyNumber.value,
        items: Tones.toneMap
            .map((key, value) {
              return MapEntry(
                  key,
                  DropdownMenuItem(
                      value: value,
                      child: Text(
                        key,
                        textAlign: TextAlign.center,
                      )));
            })
            .values
            .toList(),
        onChanged: onChanged));
  }

  void onChanged(value) {
    controller.currentKeyNumber.value = value;
  }
}
