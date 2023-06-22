// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Application/cubit/payment_state.dart';
import 'package:payment/Application/utils/constants.dart';
import 'package:payment/Domain/Api%20Network/dio_helper.dart';
import 'package:payment/Domain/Api%20Network/end_points.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFirstToken(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String price,
  ) async {
    DioHelperPayment.postPaymentData(
      url: authenticationRequest,
      data: {"api_key": payMobApiKey},
    ).then((value) {
      payMobFirstToken = value.data["token"].toString();
      print('First Token : $payMobFirstToken');
      getOrderId(firstName, lastName, email, phoneNumber, price);
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(PaymentErrorState(error));
    });
  }

  Future getOrderId(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String price,
  ) async {
     DioHelperPayment.postPaymentData(
      url: orderRegistrationApi,
      data: {
        "auth_token": payMobFirstToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      },
    ).then((value) {
      payMobOrderId = value.data["id"].toString();
      print('Order Id : $payMobOrderId');
      getFinalTokenCard(firstName, lastName, email, phoneNumber, price);
      getFinalTokenKiosk(firstName, lastName, email, phoneNumber, price);
      emit(PaymentOrderIdSuccessState());
    }).catchError((error) {
      emit(PaymentOrderIdErrorState(error));
    }).toString();
  }

  Future getFinalTokenCard(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String price,
  ) async {
    DioHelperPayment.postPaymentData(
      url: paymentKeyRequestCard,
      data: {
        "auth_token": payMobFirstToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": payMobOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integrationCardId,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      finalTokenCard = value.data["token"].toString();
      print('Final Token Card : $finalTokenCard');
      emit(PaymentRequestTokenSuccessState());
    }).catchError((error) {
      emit(PaymentRequestTokenErrorState(error));
    });
  }

  Future getFinalTokenKiosk(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String price,
  ) async {
    DioHelperPayment.postPaymentData(
      url: paymentKeyRequestCard,
      data: {
        "auth_token": payMobFirstToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": payMobOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integrationKioskId,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      finalTokenKiosk = value.data["token"];
      print('Final Token Kiosk : $finalTokenKiosk');
      emit(PaymentRequestTokenKioskSuccessState());
    }).catchError((error) {
      emit(PaymentRequestTokenKioskErrorState(error));
    });
  }
}
