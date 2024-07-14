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
      if (canteens.isNotEmpty) {
        emit(HomeDataLoaded(canteens: canteens));
      } else {
        emit(HomeError());
      }
    });

    on<HomeOnReorder>((event, emit) {
      final canteens = event.canteens;
      final canteen = canteens.removeAt(event.oldIndex);

      if (event.oldIndex < event.newIndex) {
        canteens.insert(event.newIndex - 1, canteen);
      } else {
        canteens.insert(event.newIndex, canteen);
      }
      mensaRepository.saveCanteenOrder(canteens);
      emit(HomeDataLoaded(canteens: canteens));
    });
  }
}
