import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../bloc/payment/payment_bloc.dart';
import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<PaymentBloc>(context).add(OnUnselectCard());
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Stack(
          children: [
            Container(),
            BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                final card = state.card!;
                return Hero(
                  tag: card.cardNumber,
                  child: CreditCardWidget(
                      cardNumber: card.cardNumberHidden,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                      isSwipeGestureEnabled: false,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {}),
                );
              },
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
