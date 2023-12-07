import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_payment/core/constants/assets.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_button.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_credit_card.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_details_method_item.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_method_list_view.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: PaymentMethodsListView(
          updatePaymentMethod: ({required index}) {
            print(index);
          },
        ),
      ),
      SliverToBoxAdapter(
        child:  CustomCreditCard(
          formKey: formKey,
          autovalidateMode: autoValidateMode,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(alignment:Alignment.bottomCenter,child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
          child: CustomButton(buttonName: 'Pay', onTap: () {
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
            }else{
              setState(() {
                autoValidateMode = AutovalidateMode.always;
              });

            }
          },),
        )),
      ),

    ],
    );
  }
}
