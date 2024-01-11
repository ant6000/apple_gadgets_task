import 'package:apple_gadgets_task/bindings/view_bindings.dart';
import 'package:apple_gadgets_task/views/screens/home_page.dart';
import 'package:apple_gadgets_task/views/screens/login_page.dart';
import 'package:apple_gadgets_task/views/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    initialRoute: token != null ? '/homepage' : '/login',
    getPages: [
      GetPage(
          name: '/login',page: () => const LoginPage(),binding: LoginBindings()),
      GetPage(
          name: '/homepage', page: () => HomePage(), binding: TradeBindings()),
      GetPage(
          name: '/profilepage',page: () => ProfilePage(),binding: ProfileBindings())
    ],
  ));
}