import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/ui/home/bloc/home_event.dart';
import 'package:simple_mensa/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MensaRepository mensaRepository;

  HomeBloc({required this.mensaRepository}) : super(HomeLoading()) {
    on<HomeLoadData>((event, emit) async {
      emit(HomeLoading());
      final canteens = await mensaRepository.getCanteens();
      emit(HomeDataLoaded(canteens: canteens));
    });
    on<HomeCanteenClicked>((event, emit) {
      // navigate to meals
    });
  }
}
