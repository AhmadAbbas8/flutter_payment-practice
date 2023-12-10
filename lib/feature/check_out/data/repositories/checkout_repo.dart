import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/errors/failure.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, Unit>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}
