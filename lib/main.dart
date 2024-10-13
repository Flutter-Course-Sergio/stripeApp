import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
