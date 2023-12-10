import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/core/constants/assets.dart';
import 'package:flutter_payment/core/services/service_locator.dart';
import 'package:flutter_payment/feature/check_out/presentation/manager/payment_cubit.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_button.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/order_info_item.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/total_price.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Image.asset(
              AssetsConstants.basketIMAGE,
            ),
          ),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: '\$0'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: '\$8'),
          const Divider(
            thickness: 2,
            color: Color(0xFFC6C6C6),
            height: 34,
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.59',
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonName: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                  create: (context) => ServiceLocator.instance.get<PaymentCubit>(),
                  child:  const PaymentMethodsBottomSheet(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
