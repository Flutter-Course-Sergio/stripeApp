import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../models/custom_credit_card.dart';
import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  final CustomCreditCard card;

  const CardPage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: card.cardNumber,
              child: CreditCardWidget(
                  cardNumber: card.cardNumberHidden,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false,
                  isSwipeGestureEnabled: false,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {}),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
