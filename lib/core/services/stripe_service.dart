import 'package:dio/dio.dart';
import 'package:flutter_payment/core/constants/key_conatants.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_model/PaymentIntentModel.dart';

import 'api_service.dart';

class StripeService{
  final ApiService apiService;

  StripeService({required this.apiService});


  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel)async{
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: KeysConstants.secretStripeKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }
}