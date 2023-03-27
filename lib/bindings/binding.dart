import 'package:dafna_web/theme/theme_controller.dart';
import 'package:get/instance_manager.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
