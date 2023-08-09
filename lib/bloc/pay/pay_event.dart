part of 'pay_bloc.dart';

@immutable
sealed class PayEvent {}

class OnSelectCard extends PayEvent {
  final CustomCreditCard card;

  OnSelectCard(this.card);
}

class OnDeactivateCard extends PayEvent {}
