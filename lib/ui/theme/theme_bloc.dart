import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/repository/user_repository.dart';
import 'package:simple_mensa/ui/theme/theme_event.dart';
import 'package:simple_mensa/ui/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final UserRepository userRepository;

  ThemeBloc({required this.userRepository, required bool useDarkTheme})
      : super(ThemeLoaded(useDarkTheme: useDarkTheme)) {
    on<ThemeSet>((event, emit) {
      emit(ThemeLoaded(useDarkTheme: event.useDarkTheme));
    });
  }
}
