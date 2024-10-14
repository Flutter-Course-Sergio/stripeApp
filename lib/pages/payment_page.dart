import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago realizado'),
        leading: const Icon(FontAwesomeIcons.commentDollar),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.star,
            color: Colors.white54,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text('¡Pago realizado correctamente!',
              style: TextStyle(color: Colors.white))
        ],
      )),
    );
  }
}
