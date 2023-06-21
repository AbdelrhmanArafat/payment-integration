import 'package:flutter/material.dart';
import 'package:payment/Domain/Api%20Network/dio_helper.dart';
import 'package:payment/Presentation/Modules/Register%20Screen/Page/register_screen.dart';

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


// void navigateTo(context, widget) => Navigator.push(
// context ,
// MaterialPageRoute(
// builder: (context) => widget),
// );

// void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (context) => widget,
// ),
// (Route<dynamic> route)=> false,
// );
