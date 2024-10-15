import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../config/config.dart';
import '../models/create_payment_intent_response.dart';

class StripeService {
  StripeService._();

  final Dio dio = Dio();
  final String _baseUrl = "https://api.stripe.com/v1/payment_intents";

  static final StripeService instance = StripeService._();

  void init() {
    Stripe.publishableKey = Environment.stripePublishableKey;
  }

  Future<void> payWithNewCard(double amount, String currency) async {
    final paymentIntentClientSecret =
        await _createPaymentIntent(amount, currency);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'Sergio Barreras'));

    await _processPayment();
  }

  Future<String?> _createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        'amount': _calculateAmount(amount),
        'currency': currency
      };

      final resp = await dio.post(_baseUrl,
          data: data,
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization": "Bearer ${Environment.stripeSecretKey}",
            "Content-Type": 'application/x-www-form-urlencoded'
          }));

      if (resp.statusCode != 200) return "";

      final paymentIntent = CreatePaymentIntentResponse.fromJson(resp.data);

      return paymentIntent.clientSecret;
    } catch (e) {
      return "";
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (_) {}
  }

  String _calculateAmount(double amount) => (amount.toInt() * 100).toString();
}
