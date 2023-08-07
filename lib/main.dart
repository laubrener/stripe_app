import 'package:flutter/material.dart';
import 'package:stripe_app/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StripeApp',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'complete_payment': (_) => const CompletePaymentPage(),
      },
      theme: ThemeData.light().copyWith(
          primaryColor: Color.fromARGB(255, 114, 40, 121),
          scaffoldBackgroundColor: Colors.grey[100]),
    );
  }
}
