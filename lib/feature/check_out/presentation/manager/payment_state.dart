part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentLoading extends PaymentState {}
class PaymentError extends PaymentState {
  final String errorMessage;

  PaymentError({required this.errorMessage});
}
class PaymentSuccess extends PaymentState {}
