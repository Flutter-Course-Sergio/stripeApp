import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/cards.dart';
import '../helpers/helpers.dart';
import '../widgets/total_pay_button.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          actions: [
            IconButton(
                onPressed: () async {
                  // showLoading(context);
                  // await Future.delayed(const Duration(seconds: 1));
                  // if (context.mounted) Navigator.pop(context);

                  showAlert(context, 'Hola', 'Mundo');
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
                      Navigator.push(
                          context,
                          navigateFadeIn(
                              context,
                              CardPage(
                                card: card,
                              )));
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
