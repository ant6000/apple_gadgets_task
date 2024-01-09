import 'package:apple_gadgets_task/controller/login_controller.dart';
import 'package:get/get.dart';

class ViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
