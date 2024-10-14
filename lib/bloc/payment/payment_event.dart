part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class OnSelectedCard extends PaymentEvent {
  final CustomCreditCard card;
  OnSelectedCard(this.card);
}

class OnUnselectCard extends PaymentEvent {}
