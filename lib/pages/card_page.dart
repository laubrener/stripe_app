import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/bloc.dart';

import '../widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payBloc = BlocProvider.of<PayBloc>(context);
    final card = payBloc.state.creditCard;

    return Scaffold(
        appBar: AppBar(
            title: const Text('Pagar'),
            centerTitle: true,
            backgroundColor: Colors.pink[300],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                payBloc.add(OnDeactivateCard());
                print(payBloc.state);
                Navigator.pop(context);
              },
            )),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: card!.cardNumber,
              child: CreditCardWidget(
                isHolderNameVisible: true,
                cardNumber: card.cardNumberHidden,
                expiryDate: card.expiracyDate,
                cardHolderName: card.cardHolderName,
                cvvCode: card.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (i) {
                  print(payBloc.state);
                },
              ),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
