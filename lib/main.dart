import 'package:flutter/material.dart';
import 'package:flutter_payment/core/constants/key_conatants.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'feature/check_out/presentation/views/my_card_view.dart';

void main() {
  Stripe.publishableKey = KeysConstants.stripePublishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: Styles.style25,
        ),
      ),
      home: const MyCardView(),
    );
  }
}

