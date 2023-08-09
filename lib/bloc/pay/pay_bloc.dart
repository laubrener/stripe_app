import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/credit_card_model.dart';

part 'pay_event.dart';
part 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(PayState()) {
    on<PayEvent>((event, emit) {
      if (event is OnSelectCard) {
        emit(state.copyWith(isCardActivated: true, creditCard: event.card));
      } else if (event is OnDeactivateCard) {
        emit(state.copyWith(isCardActivated: false));
      }
    });
  }
}
