import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/extension/build_context_extension.dart';
import 'package:simple_mensa/ui/home/home_screen.dart';
import 'package:simple_mensa/ui/settings/bloc/settings_bloc.dart';
import 'package:simple_mensa/ui/settings/bloc/settings_event.dart';
import 'package:simple_mensa/ui/settings/bloc/settings_state.dart';
import 'package:simple_mensa/ui/theme/theme_bloc.dart';
import 'package:simple_mensa/ui/theme/theme_event.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_drawer.dart';
import 'package:simple_mensa/ui/widget/simple_progress_indicator.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(userRepository: context.read())
        ..add(const SettingsLoadData()),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (route) => false);
        },
        child: Scaffold(
          appBar: SimpleAppBar(
            title: context.loc.settings,
          ),
          drawer: const SimpleDrawer(
            selectedIndex: 1,
          ),
          body: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
            if (state is SettingsDataLoaded) {
              return _buildSettingsList(context, state);
            } else {
              return const SimpleProgressIndicator();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context, SettingsDataLoaded settings) {
    return ListView(
      children: [
        const Divider(),
        ListTile(
          title: Text(context.loc.settings_change_theme),
          trailing: Switch(
            value: settings.userSettings.useDarkTheme,
            onChanged: (value) {
              final userSettings =
                  settings.userSettings.copyWith(useDarkTheme: value);
              context
                  .read<SettingsBloc>()
                  .add(SettingsSetInput(userSettings: userSettings));
              context.read<ThemeBloc>().add(ThemeSet(useDarkTheme: value));
            },
          ),
        ),
        const Divider(),
        ListTile(
          title: Text(context.loc.settings_highlight_vegan),
          trailing: Switch(
            value: settings.userSettings.highlightVegan,
            onChanged: (value) {
              context.read<SettingsBloc>().add(SettingsSetInput(
                  userSettings:
                      settings.userSettings.copyWith(highlightVegan: value)));
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}
