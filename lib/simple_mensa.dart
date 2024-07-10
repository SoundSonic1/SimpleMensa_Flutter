import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/data/service/mensa_client.dart';
import 'package:simple_mensa/ui/home/home_screen.dart';

class SimpleMensa extends StatelessWidget {
  const SimpleMensa({super.key});

  static const title = 'SimpleMensa';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) {
        final client = MensaClient(Dio());
        return MensaRepository(mensaClient: client);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
