import 'package:dio/dio.dart';
import 'package:flutter_payment/core/services/api_service.dart';
import 'package:flutter_payment/core/services/stripe_service.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/data/repositories/checkout_repo.dart';
import 'package:flutter_payment/feature/check_out/data/repositories/checkout_repo_impl.dart';
import 'package:flutter_payment/feature/check_out/presentation/manager/payment_cubit.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  ServiceLocator._();

  static final instance = GetIt.instance;

  static setup() async {
    PaymentIntentInputModel paymentIntentInputModel =
        PaymentIntentInputModel(amount: '100', currency: 'USD',customerId: 'cus_PAFbbKUkxu0CoC');
    instance.registerLazySingleton<PaymentIntentInputModel>(
        () => paymentIntentInputModel);

    instance.registerFactory<ApiService>(() => ApiService(dio: Dio()));
    instance.registerFactory<StripeService>(
        () => StripeService(apiService: instance<ApiService>()));
    instance.registerFactory<CheckoutRepo>(
        () => CheckoutRepoImpl(stripeService: instance<StripeService>()));
    instance.registerFactory<PaymentCubit>(
        () => PaymentCubit(checkoutRepo: instance<CheckoutRepo>()));
  }
}
