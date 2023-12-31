import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment/feature/check_out/presentation/views/thank_you_view.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_button.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_credit_card.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_method_list_view.dart';

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
            if (kDebugMode) {
              print(index);
            }
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ThankYouView(),));
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
