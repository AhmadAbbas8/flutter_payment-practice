import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/data/repositories/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitial());
  CheckoutRepo checkoutRepo;

  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (left) => emit(PaymentError(errorMessage: left.errMessage)),
      (right) => emit(PaymentSuccess()),
    );
  }


  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
