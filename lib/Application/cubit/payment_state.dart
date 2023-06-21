class PaymentError {
  String message;
  PaymentError(this.message);
}

class PaymentSuccess {
  String orderId;
  PaymentSuccess(this.orderId);
}

class PaymentState {
}

class PaymentInitialState extends PaymentState {}

class PaymentErrorState extends PaymentState {
  PaymentError error;
  PaymentErrorState(this.error);
}

class PaymentSuccessState extends PaymentState {
  PaymentSuccess success;
  PaymentSuccessState(this.success);
}
