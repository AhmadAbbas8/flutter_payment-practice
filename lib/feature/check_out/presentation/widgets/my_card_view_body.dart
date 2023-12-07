import 'package:flutter/material.dart';
import 'package:flutter_payment/core/constants/assets.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_payment/feature/check_out/presentation/views/payment_details_view.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_button.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/order_info_item.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/total_price.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Image.asset(
              AssetsConstants.basketIMAGE,
            ),
          ),
          SizedBox(height: 25),
          OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Discount', value: '\$0'),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Shipping', value: '\$8'),
          Divider(
            thickness: 2,
            color: Color(0xFFC6C6C6),
            height: 34,
          ),
          TotalPrice(
            title: 'Total',
            value: r'$50.59',
          ),
          SizedBox(height: 16),
          CustomButton(
            buttonName: 'Complete Payment',
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PaymentDetailsView(),
            )),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
