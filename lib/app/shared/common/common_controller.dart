import 'package:get/get.dart';

import '../../models/entities/saved_data_model.dart';
import '../utils/preference_helper.dart';

class CommonController extends GetxController {
  /// store any data based on model property
  final savedDataModel = SavedDataModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {}

  init() async {
    getSavedData();
  }

  /// get cart local storage saved data by fetch preference
  SavedDataModel getSavedData() {
    savedDataModel.value = PreferenceHelper().getSavedData ?? SavedDataModel();
    savedDataModel.refresh();
    return savedDataModel.value;
  }
}
