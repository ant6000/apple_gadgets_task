import 'dart:convert';

import 'package:apple_gadgets_task/repository/login_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;

  loginUser(String login, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoading.toggle();
      final response = await LoginApiClient.loginUser(login, password);
      if (response.statusCode == 200) {
        final loginToken = jsonDecode(response.body);
        await prefs.setString('token', loginToken['token']);
        await prefs.setString('login', login);
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
