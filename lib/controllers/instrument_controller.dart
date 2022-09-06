import 'package:get/get.dart';

import '../constants/constants.dart';

class InstrumentController extends GetxController {
  var currentInstrument = Instruments.instruments
      .firstWhere((element) => element['name'] == '8-Bits')['path']
      .obs;

  void changeInstrument(instrument) {
    currentInstrument.value = instrument;
  }
}
