import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:stripe_payment/stripe_payment.dart';

import '../models/stripe_custom_response.dart';
import '../secrets.dart';

class StripeService {
  StripeService._privatecontructor();
  static final StripeService _instance = StripeService._privatecontructor();
  factory StripeService() => _instance;

  void init() async {
    // WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey = apiKey;
    Stripe.merchantIdentifier = 'test';
    await Stripe.instance.applySettings();

    // StripePayment.publishableKey.setOptions(
    //   StripeOptions(
    //     publishableKey: apiKey, androidPayMode: 'test', merchantId: 'test'
    //     ));
  }

  Future payWithExistentCard({
    required String amount,
    required String currency,
    required card,
  }) async {}

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      // final paymentMethod = await StripePayment.paymentRequestWithCardForm(
      //     CardFormPaymentRequest());
      final paymentMethod = await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              merchantDisplayName: Stripe.merchantIdentifier,
              setupIntentClientSecret: secretKey));

      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future AppleOrGooglePay({
    required String amount,
    required String currency,
  }) async {}
  Future _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {}
  Future _makePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}
