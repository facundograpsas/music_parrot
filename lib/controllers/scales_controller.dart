import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/constants.dart';

class ScalesController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    currentScale.value = [...Scales.cMajor.map((e) => e.obs)].obs;
  }

  var currentScale = [].obs;

  var scaleName = 'C Major'.obs;

  changeScale(scale) {
    if (scale == 'cMinor') {
      currentScale.value = [...Scales.cMinor.map((e) => e.obs)].obs;
    }
  }
}
