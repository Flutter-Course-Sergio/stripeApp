import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ??
      'No está configurado el STRIPE_PUBLISHABLE_KEY';

  static String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ??
      'No está configurado el STRIPE_SECRET_KEY';
}
