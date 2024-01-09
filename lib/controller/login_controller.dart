import 'package:apple_gadgets_task/repository/login_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

  loginUser(String email, String password) async {
    try {
      isLoading.toggle();
      final response = await LoginApiClient.loginUser(email, password);
      if (response.statusCode == 200) {
        Get.offNamed('/homepage');
        isLoading.toggle();
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Login Error',
            message: response.body,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      isLoading.toggle();
    } finally {
      isLoading.toggle();
    }
  }
}
