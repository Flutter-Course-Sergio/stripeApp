import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/payment/payment_bloc.dart';
import 'config/config.dart';
import 'pages/pages.dart';
import 'services/stripe_service.dart';

void main() async {
  await Environment.initEnvironment();
  StripeService.instance.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PaymentBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StripeApp',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'payment': (_) => const PaymentPage(),
        },
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0XFF21232A),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0XFF284879),
              foregroundColor: Colors.white,
            )),
      ),
    );
  }
}
