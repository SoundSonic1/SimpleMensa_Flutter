import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/repository/user_repository.dart';
import 'package:simple_mensa/ui/settings/bloc/settings_event.dart';
import 'package:simple_mensa/ui/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository userRepository;

  SettingsBloc({required this.userRepository}) : super(SettingsLoading()) {
    on<SettingsLoadData>((event, emit) async {
      emit(SettingsLoading());
      final settings = await userRepository.getUserSettings();
      emit(SettingsDataLoaded(userSettings: settings));
    });
    on<SettingsSetInput>((event, emit) {
      userRepository.saveUserSettings(event.userSettings);
      emit(SettingsDataLoaded(userSettings: event.userSettings));
    });
  }
}
