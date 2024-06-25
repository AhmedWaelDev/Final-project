part of 'payment_cubit.dart';

@sealed
class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentPointsLoaded extends PaymentState {
  final int points;

  PaymentPointsLoaded(this.points);
}

class PaymentFailure extends PaymentState {
  final String errMessage;

  PaymentFailure({required this.errMessage});
}
