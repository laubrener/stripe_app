part of 'pay_bloc.dart';

class PayState {
  final double amountToPay;
  final String currency;
  final bool isCardActivated;
  final CustomCreditCard? creditCard;

  String get amountToPayString => '${(amountToPay * 100).floor()}';

  PayState(
      {this.amountToPay = 375.75,
      this.currency = 'USD',
      this.isCardActivated = false,
      this.creditCard});

  PayState copyWith({
    double? amountToPay,
    String? currency,
    bool? isCardActivated,
    CustomCreditCard? creditCard,
  }) =>
      PayState(
        amountToPay: amountToPay ?? this.amountToPay,
        currency: currency ?? this.currency,
        creditCard: creditCard ?? this.creditCard,
        isCardActivated: isCardActivated ?? this.isCardActivated,
      );

  List<Object> get props => [amountToPay, currency, isCardActivated];

  @override
  String toString() => 'isCardActivated: $isCardActivated';
}
