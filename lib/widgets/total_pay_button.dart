import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/payment/payment_bloc.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('${state.paymentAmount} ${state.currency}',
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              _BtnPay(isCardActive: state.activeCard)
            ],
          ),
        );
      },
    );
  }
}

class _BtnPay extends StatelessWidget {
  final bool isCardActive;

  const _BtnPay({required this.isCardActive});

  @override
  Widget build(BuildContext context) {
    return isCardActive
        ? buildCardButton(context)
        : buildAppleAndGooglePay(context);
  }

  Widget buildCardButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          SizedBox(width: 15),
          Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white),
          const SizedBox(width: 10),
          const Text('Pay',
              style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
      onPressed: () {},
    );
  }
}
