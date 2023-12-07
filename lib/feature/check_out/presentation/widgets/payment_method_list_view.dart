import 'package:flutter/material.dart';
import 'package:flutter_payment/core/constants/assets.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_details_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});

  final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    AssetsConstants.cardSVG,
  AssetsConstants.masterCardSVG,
    AssetsConstants.paypalSVG,
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                  widget.updatePaymentMethod(index: activeIndex);
                },
                child: PaymentDetailsMethodItem(
                  isActive: activeIndex == index,
                  imagePath: paymentMethodsItems[index],
                ),
              ),
            );
          }),
    );
  }
}