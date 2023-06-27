import 'package:flutter/material.dart';
import 'package:payment/Domain/Api_Network/dio_helper.dart';
import 'package:payment/Presentation/Modules/Register_Screen/Page/register_screen.dart';
void main() async {
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
