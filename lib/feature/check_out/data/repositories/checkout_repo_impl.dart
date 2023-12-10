import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/services/stripe_service.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/data/repositories/checkout_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/errors/failure.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});

  @override
  Future<Either<Failure, Unit>> makePayment({required PaymentIntentInputModel paymentIntentInputModel})
  async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(unit);
    } on StripeException catch (e) {
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
