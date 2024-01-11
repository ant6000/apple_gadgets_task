import 'dart:convert';
import 'package:apple_gadgets_task/model/profile_model.dart';
import 'package:apple_gadgets_task/repository/profile_info.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Rx<Profile> profile = Profile(
    address: '',
    balance: 0.0,
    city: '',
    country: '',
    currency: 0,
    currentTradesCount: 0,
    currentTradesVolume: 0.0,
    equity: 0.0,
    freeMargin: 0.0,
    isAnyOpenTrades: false,
    isSwapFree: false,
    leverage: 0,
    name: '',
    phone: '',
    totalTradesCount: 0,
    totalTradesVolume: 0.0,
    type: 0,
    verificationLevel: 0,
    zipCode: '',
  ).obs;
  RxString phoneNumber = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? login = prefs.getString('login');
    fetchProfileInfo(login!, token!);
    getPhoneNumber(login, token);
    super.onInit();
  }

  Future fetchProfileInfo(String login, String token) async {
    try {
      isLoading.toggle();
      final response = await ProfileRepo.getProfileInfo(
          'GetAccountInformation', login, token);
      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        profile.value = Profile.fromJson(jsondata);
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
      isLoading.toggle();
      print(e.toString());
    } finally {
      isLoading.toggle();
    }
  }

  Future getPhoneNumber(String login, String token) async {
    try {
      final response = await ProfileRepo.getProfileInfo(
          'GetLastFourNumbersPhone', login, token);
      if (response.statusCode == 200) {
        phoneNumber.value = response.body;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Error',
            message: response.body,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
