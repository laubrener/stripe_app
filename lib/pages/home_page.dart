import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/pages/card_page.dart';

import '../bloc/bloc.dart';
import '../helpers/helpers.dart';
import '../service/stripe_service.dart';
import '../widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stripeService = StripeService();
    final payBloc = BlocProvider.of<PayBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          centerTitle: true,
          backgroundColor: Colors.pink[300],
          actions: [
            IconButton(
                onPressed: () async {
                  final amount = payBloc.state.amountToPayString;
                  final currency = payBloc.state.currency;

                  final resp = await stripeService.payWithNewCard(
                      amount: amount, currency: currency);

                  if (resp.ok) {
                    showAlert(context, 'Tarjeta ok', 'Todo correcto');
                  } else {
                    showAlert(context, 'Algo salió mal', resp.msg!);
                  }
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: const BouncingScrollPhysics(),
                  itemCount: cards.length,
                  itemBuilder: (_, i) {
                    final card = cards[i];

                    return GestureDetector(
                      onTap: () {
                        payBloc.add(OnSelectCard(card));
                        print(payBloc.state);
                        Navigator.push(
                            context, fadeInNavigate(context, const CardPage()));
                      },
                      child: Hero(
                        tag: card.cardNumber,
                        child: CreditCardWidget(
                          isHolderNameVisible: true,
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
                    );
                  }),
            ),
            const Positioned(bottom: 0, child: TotalPayButton())
          ],
        ));
  }
}
