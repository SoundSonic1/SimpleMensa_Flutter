import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_event.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_state.dart';
import 'package:simple_mensa/util/constants.dart';

class CanteenBloc extends Bloc<CanteenEvent, CanteenState> {
  final MensaRepository mensaRepository;

  CanteenBloc({required this.mensaRepository}) : super(CanteenLoading()) {
    on<CanteenLoadData>((event, emit) async {
      emit(CanteenLoading());
      final dateTimeNow = DateTime.now();
      final meals = await mensaRepository.getMeals(event.canteen.id.toString(),
          DateFormat(Constants.dateFormat).format(dateTimeNow));
      if (meals.isNotEmpty) {
        emit(CanteenDataLoaded(meals: meals));
      } else {
        emit(CanteenError());
      }
    });
  }
}
