import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/constants.dart';

class ScalesController extends GetxController {
  var initialKeyNumber = 60.obs;
  var currentKeyNumber = 60.obs;

  @override
  void onReady() {
    super.onReady();
    currentScale.value = [
      ...Scales.majorPattern.map((e) {
        var tone = Tone('', initialKeyNumber.value, false).obs;
        initialKeyNumber += e;
        return tone;
      })
    ];
  }

  @override
  void onInit() {
    super.onInit();
    currentKeyNumber.listen((newKey) {
      initialKeyNumber.value = newKey;
      currentScale.value = [
        ...Scales.majorPattern.map((e) {
          var tone = Tone('', initialKeyNumber.value, false).obs;
          initialKeyNumber += e;
          return tone;
        })
      ];
    });
  }

  var currentScale = [].obs;

  var scaleName = 'C Major'.obs;

  changeScale(scale) {
    if (scale == 'cMinor') {
      currentScale.value = [...Scales.cMinor.map((e) => e.obs)].obs;
    }
  }
}
