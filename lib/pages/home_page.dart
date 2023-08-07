import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/pages/card_page.dart';

import '../helpers/helpers.dart';
import '../widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagar'),
          centerTitle: true,
          backgroundColor: Colors.pink[300],
          actions: [
            IconButton(
                onPressed: () async {
                  showLoading(context);

                  await Future.delayed(const Duration(seconds: 1));

                  Navigator.pop(context);
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
