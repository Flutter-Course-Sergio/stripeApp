part of 'payment_bloc.dart';

@immutable
class PaymentState {
  final double paymentAmount;
  final String currency;
  final bool activeCard;
  final CustomCreditCard? card;

  const PaymentState(
      {this.paymentAmount = 375.55,
      this.currency = 'USD',
      this.activeCard = false,
      this.card});

  PaymentState copyWith({
    double? paymentAmount,
    String? currency,
    bool? activeCard,
    CustomCreditCard? card,
  }) {
    return PaymentState(
      paymentAmount: paymentAmount ?? this.paymentAmount,
      currency: currency ?? this.currency,
      activeCard: activeCard ?? this.activeCard,
      card: card ?? this.card,
    );
  }
}
