import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Application/cubit/payment_cubit.dart';
import 'package:payment/Application/cubit/payment_state.dart';
import 'package:payment/Application/utils/color.dart';
import 'package:payment/Application/widgets/my_button.dart';
import 'package:payment/Application/widgets/my_text_from_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Payment Integration'),
            centerTitle: true,
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First Name
                    MyTextFromField(
                      controller: firstNameController,
                      type: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Entre Your First Name';
                        }
                        return null;
                      },
                      label: 'First Name',
                      prefix: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    // Last Name
                    MyTextFromField(
                      controller: lastNameController,
                      type: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Entre Your Last Name';
                        }
                        return null;
                      },
                      label: 'Last Name',
                      prefix: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    //Email Address
                    MyTextFromField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Entre Your Email Address';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    //phone number
                    MyTextFromField(
                      controller: phoneNumberController,
                      type: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Entre Your Phone Number';
                        }
                        return null;
                      },
                      label: 'phone number',
                      prefix: Icons.phone,
                    ),
                    const SizedBox(height: 20),
                    // Price
                    MyTextFromField(
                      controller: priceController,
                      type: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Entre Your Price';
                        }
                        return null;
                      },
                      label: 'Price',
                      prefix: Icons.price_check_outlined,
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onPressed: () async {
                        PaymentCubit.get(context).getFirstToken(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          phoneNumberController.text,
                          priceController.text,
                        );
                      },
                      text: 'Go To Pay',
                      radius: 15,
                      width: 250,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
