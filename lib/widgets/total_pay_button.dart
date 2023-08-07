import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        height: 170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '250.55 USD',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                _BtnPay()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return true ? buildCardBtn(context) : buildAppleAndGooglePay(context);
  }

  Widget buildCardBtn(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: MediaQuery.of(context).size.width * .9,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.pink[300],
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          SizedBox(width: 20),
          Text(
            'Pagar',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.pink[300]),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Pagar',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
