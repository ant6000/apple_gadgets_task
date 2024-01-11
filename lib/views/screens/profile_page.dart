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
                    buildInfoRow('Address', controller.profile.value.address),
                    buildInfoRow('City', controller.profile.value.city),
                    buildInfoRow('Zip Code', controller.profile.value.zipCode),
                    buildInfoRow('Country', controller.profile.value.country),
                    buildInfoRow('Balance', controller.profile.value.balance.toString()),
                    buildInfoRow('Equity', controller.profile.value.equity.toString()),
                    buildInfoRow('Free Margin', controller.profile.value.freeMargin.toString()),
                    buildInfoRow('Leverage', controller.profile.value.leverage.toString()),
                    buildInfoRow('Total Trades Count', controller.profile.value.totalTradesCount.toString()),
                    buildInfoRow('Total Trades Volume', controller.profile.value.totalTradesVolume.toString()),
                    buildInfoRow('Current Trades Count', controller.profile.value.currentTradesCount.toString()),
                    buildInfoRow('Current Trades Volume', controller.profile.value.currentTradesVolume.toString()),
                    buildInfoRow('Verification Level', controller.profile.value.verificationLevel.toString()),
                  ],
                ),
              ),
      ),
    );
  }
}
