import 'package:flutter/material.dart';
import 'package:payment/Application/utils/color.dart';
import 'package:payment/Application/utils/constants.dart';

import '../../Register_Screen/page/register_screen.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                      'Are You Sure That You Completed The Payment',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),

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
