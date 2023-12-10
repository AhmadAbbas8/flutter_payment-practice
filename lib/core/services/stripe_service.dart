import 'package:dio/dio.dart';
import 'package:flutter_payment/core/constants/key_conatants.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_model/PaymentIntentModel.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../feature/check_out/data/models/ephemeral_key/ephemeral_key_model.dart';
import '../../feature/check_out/data/models/init_payment_sheet_input_model.dart';
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

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel
      initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
        initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Ahmad Abbas',
      ),
    );
  }

  Future<PaymentSheetPaymentOption?> displayPaymentSheet() async =>
    await Stripe.instance.presentPaymentSheet();


  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
    await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: KeysConstants.secretStripeKey,
        headers: {
          'Authorization': "Bearer ${KeysConstants.secretStripeKey}",
          'Stripe-Version': '2023-08-16',
        });

    var ephermeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephermeralKey;
  }
}