import 'dart:convert';
import 'package:apple_gadgets_task/repository/fetch_trades.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TradeController extends GetxController {
  final RxList<Map<String, dynamic>> trades = <Map<String, dynamic>>[].obs;
  final RxDouble totalProfit = 0.0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchTrades();
    ever(trades, (_) => calculateTotalProfit());
    super.onInit();
  }

  Future<void> fetchTrades() async {
    isLoading.toggle();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? token = prefs.getString('token');
      final response = await FetchTradesRepo.fetchTrades(token!);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        trades.assignAll(jsonList.cast<Map<String, dynamic>>());
      } else {
        Get.offNamed('/login');
      }
    } catch (e) {
      print('Error fetching trades: $e');
      isLoading.toggle();
    } finally {
      isLoading.toggle();
    }
  }

  void calculateTotalProfit() {
    totalProfit.value =
        trades.fold(0.0, (sum, trade) => sum + (trade['profit'] ?? 0.0));
  }
}
