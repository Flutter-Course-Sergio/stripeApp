import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/custom_credit_card.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<OnSelectedCard>((event, emit) =>
        emit(state.copyWith(activeCard: true, card: event.card)));

    on<OnUnselectCard>(
        (event, emit) => emit(state.copyWith(activeCard: false)));
  }
}
