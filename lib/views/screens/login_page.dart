import 'package:apple_gadgets_task/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Enter Email'),
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: passwordController,
                obscureText: controller.showPassword.value,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.showPassword.toggle();
                      },
                      child: controller.showPassword.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    hintText: 'Enter Password'),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    onPressed: () {
                      controller.loginUser(
                          emailController.text, passwordController.text);
                    },
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
