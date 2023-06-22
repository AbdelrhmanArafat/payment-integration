abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}

class PaymentSuccessState extends PaymentState {}

class PaymentErrorState extends PaymentState {
  String error;
  PaymentErrorState(this.error);
}

class PaymentOrderIdSuccessState extends PaymentState {}

class PaymentOrderIdErrorState extends PaymentState {
  String error;
  PaymentOrderIdErrorState(this.error);
}

class PaymentRequestTokenCardSuccessState extends PaymentState {}

class PaymentRequestTokenCardErrorState extends PaymentState {
  String error;
  PaymentRequestTokenCardErrorState(this.error);
}

class PaymentRequestTokenKioskSuccessState extends PaymentState {}

class PaymentRequestTokenKioskErrorState extends PaymentState {
  String error;
  PaymentRequestTokenKioskErrorState(this.error);
}
