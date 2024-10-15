import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/services/stripe_service.dart';

import '../bloc/payment/payment_bloc.dart';
import '../data/cards.dart';
import '../helpers/helpers.dart';
import '../widgets/total_pay_button.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          actions: [
            IconButton(
                onPressed: () async {
                  await StripeService.instance.payWithNewCard(
                      paymentBloc.state.paymentAmount,
                      paymentBloc.state.currency);
                },
                icon: const Icon(Icons.add))
          ],
          leading: const Icon(FontAwesomeIcons.sackDollar),
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: size.width / 2 + 30,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                physics: const BouncingScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (_, i) {
                  final card = cards[i];

                  return GestureDetector(
                    onTap: () {
                      paymentBloc.add(OnSelectedCard(card));

                      Navigator.push(
                          context, navigateFadeIn(context, const CardPage()));
                    },
                    child: Hero(
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
                  );
                },
              ),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
