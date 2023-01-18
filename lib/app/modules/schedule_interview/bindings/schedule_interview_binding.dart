import 'package:get/get.dart';

import '../controllers/schedule_interview_controller.dart';

class ScheduleInterviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleInterviewController>(
      () => ScheduleInterviewController(),
    );
  }
}
