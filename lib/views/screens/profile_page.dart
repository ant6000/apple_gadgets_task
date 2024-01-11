import 'package:apple_gadgets_task/controller/profile_controller.dart';
import 'package:apple_gadgets_task/views/widgets/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(controller.profile.value.name,
                        style: const TextStyle(fontSize: 20)),
                    Text(controller.phoneNumber.value,
                        style: const TextStyle(fontSize: 20, color: Colors.blue)),
                    buildInfoRow('Address', 'Мусы Джалиля д.32 кор.1 кв.77'),
                    buildInfoRow('City', 'Калининград'),
                    buildInfoRow('Zip Code', 'ru236022'),
                    buildInfoRow('Country', 'Belarus'),
                    buildInfoRow('Balance', '314.79'),
                    buildInfoRow('Equity', '243.90000000000003'),
                    buildInfoRow('Free Margin', '76.25484000000003'),
                    buildInfoRow('Leverage', '1'),
                    buildInfoRow('Total Trades Count', '1636'),
                    buildInfoRow('Total Trades Volume', '76.12'),
                    buildInfoRow('Current Trades Count', '04'),
                    buildInfoRow('Current Trades Volume', '0.225'),
                    buildInfoRow('Verification Level', '1'),
                  ],
                ),
              ),
      ),
    );
  }
}
