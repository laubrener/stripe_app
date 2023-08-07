import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../models/credit_card_model.dart';
import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = CustomCreditCard(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Laura Brener');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          centerTitle: true,
          backgroundColor: Colors.pink[300],
        ),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: card.cardNumber,
              child: CreditCardWidget(
                cardNumber: card.cardNumberHidden,
                expiryDate: card.expiracyDate,
                cardHolderName: card.cardHolderName,
                cvvCode: card.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (i) {
                  print(i.brandName);
                },
              ),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
