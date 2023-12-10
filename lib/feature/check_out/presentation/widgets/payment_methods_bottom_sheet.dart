import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/core/services/service_locator.dart';
import 'package:flutter_payment/feature/check_out/data/models/payment_intent_input_model.dart';
import 'package:flutter_payment/feature/check_out/presentation/manager/payment_cubit.dart';
import 'package:flutter_payment/feature/check_out/presentation/views/thank_you_view.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/custom_button.dart';
import 'package:flutter_payment/feature/check_out/presentation/widgets/payment_method_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(height: 32),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ));
              } else if (state is PaymentError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return CustomButton(
                buttonName: 'Continue',
                isLoading: state is PaymentLoading ? true : false,
                onTap: () => context.read<PaymentCubit>().makePayment(
                    paymentIntentInputModel:
                        ServiceLocator.instance<PaymentIntentInputModel>()),
              );
            },
          )
        ],
      ),
    );
  }
}
