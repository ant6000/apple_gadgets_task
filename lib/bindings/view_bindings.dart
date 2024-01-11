import 'package:apple_gadgets_task/controller/profile_controller.dart';
import 'package:apple_gadgets_task/controller/login_controller.dart';
import 'package:apple_gadgets_task/controller/trade_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
class TradeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TradeController());
  }
}
class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
