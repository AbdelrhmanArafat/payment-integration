import 'package:flutter/material.dart';
import 'package:payment/Application/utils/color.dart';
import 'package:payment/Application/utils/constants.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'You Should Go To Any Market To Pay',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'This Is Reference Code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 15,
                shape: Border.all(
                  color: primaryColor,
                  width: 2,
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    referenceCode,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
