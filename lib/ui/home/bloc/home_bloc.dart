import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/data/repository/user_repository.dart';
import 'package:simple_mensa/ui/home/bloc/home_event.dart';
import 'package:simple_mensa/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MensaRepository mensaRepository;
  final UserRepository userRepository;

  HomeBloc({required this.mensaRepository, required this.userRepository})
      : super(const HomeLoading()) {
    on<HomeLoadData>((event, emit) async {
      emit(const HomeLoading());
      final canteens = await mensaRepository.getCanteens();
      if (canteens.isNotEmpty) {
        emit(HomeDataLoaded(
            canteens: canteens,
            showInitialDialog: userRepository.showInitialDialog));
      } else {
        emit(const HomeError());
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
      emit(HomeDataLoaded(
          canteens: canteens,
          showInitialDialog: userRepository.showInitialDialog));
    });

    on<HomeDismissedDialog>((event, emit) {
      userRepository.showInitialDialog = false;
    });
  }
}
