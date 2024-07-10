import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/simple_mensa.dart';
import 'package:simple_mensa/ui/home/bloc/home_bloc.dart';
import 'package:simple_mensa/ui/home/bloc/home_event.dart';
import 'package:simple_mensa/ui/home/bloc/home_state.dart';
import 'package:simple_mensa/ui/home/widget/canteen_card.dart';
import 'package:simple_mensa/ui/widget/animations.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            HomeBloc(mensaRepository: RepositoryProvider.of(context))
              ..add(HomeLoadData()),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Scaffold(
              appBar: const SimpleAppBar(
                title: SimpleMensa.title,
              ),
              body: _buildBody(context, state));
        }),
      );

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state is HomeDataLoaded) {
      final canteens = state.canteens;
      return ListView.builder(
        itemCount: canteens.length,
        itemBuilder: (context, index) {
          return CanteenCard(canteen: canteens[index]);
        },
      );
    } else {
      return Animations.progressIndicator();
    }
  }
}
