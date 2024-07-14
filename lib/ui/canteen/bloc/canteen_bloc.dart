import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/data/repository/user_repository.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_event.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_state.dart';
import 'package:simple_mensa/util/constants.dart';

class CanteenBloc extends Bloc<CanteenEvent, CanteenState> {
  final MensaRepository mensaRepository;
  final UserRepository userRepository;

  CanteenBloc({required this.mensaRepository, required this.userRepository})
      : super(CanteenLoading()) {
    on<CanteenLoadData>((event, emit) async {
      emit(CanteenLoading());
      final userSettings = await userRepository.getUserSettings();
      final meals = await mensaRepository.getMeals(event.canteen.id.toString(),
          DateFormat(Constants.dateFormat).format(event.dateTime));
      if (meals.isNotEmpty) {
        emit(CanteenDataLoaded(meals: meals, userSettings: userSettings));
      } else {
        emit(CanteenError());
      }
    });
  }
}
