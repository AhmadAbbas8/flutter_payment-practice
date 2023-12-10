import 'package:flutter/material.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_details_body.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/assets.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            AssetsConstants.arrowSVG,
          ),
        ),
        title: const Text(
          'Payment Details',
        ),
      ),
      body: const PaymentDetailsBody(),
    );
  }
}
