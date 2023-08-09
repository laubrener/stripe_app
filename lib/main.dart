import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/service/stripe_service.dart';

import 'bloc/bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    StripeService().init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PayBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'StripeApp',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'complete_payment': (_) => const CompletePaymentPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: const Color.fromARGB(255, 114, 40, 121),
            scaffoldBackgroundColor: Colors.grey[100]),
      ),
    );
  }
}
