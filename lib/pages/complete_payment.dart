import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompletePaymentPage extends StatelessWidget {
  const CompletePaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago realizado!'),
        backgroundColor: Colors.pink[300],
        centerTitle: true,
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            FontAwesomeIcons.circleCheck,
            color: Colors.white54,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Pago realizado correctamente!',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ]),
      ),
    );
  }
}
