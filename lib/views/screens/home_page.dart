import 'package:apple_gadgets_task/controller/trade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final colors = [
    Colors.grey.withOpacity(.2),
    Colors.orange.withOpacity(.2),
  ];
  final TradeController tradeController = Get.find<TradeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple Gadgets'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/profilepage');
            },
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(
        () => tradeController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              const BorderSide(width: 5, color: Colors.white)),
                      tileColor: colors[1],
                      title: Text(
                        'Total Profit: ${tradeController.totalProfit}',
                        style: const TextStyle(fontSize: 20),
                      )),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tradeController.trades.length,
                      itemBuilder: (context, index) {
                        final trade = tradeController.trades[index];
                        return ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 5, color: Colors.white)),
                          tileColor: index.isEven ? colors[0] : colors[1],
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(trade['symbol']),
                              Text('Current Price: ${trade['currentPrice']}'),
                            ],
                          ),
                          subtitle: Text('Profit: ${trade['profit']}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => tradeController.fetchTrades(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
