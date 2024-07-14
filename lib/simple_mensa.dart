import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/data/service/mensa_client.dart';
import 'package:simple_mensa/objectbox.g.dart';
import 'package:simple_mensa/ui/home/home_screen.dart';

class SimpleMensa extends StatelessWidget {
  const SimpleMensa({super.key, required this.store});

  static const title = 'SimpleMensa';
  final Store store;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) {
        final client = MensaClient(Dio());
        return MensaRepository(
            mensaClient: client,
            canteenBox: store.box<Canteen>(),
            settingsBox: store.box<UserSettings>());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeScreen(),
      ),
    );
  }
}
