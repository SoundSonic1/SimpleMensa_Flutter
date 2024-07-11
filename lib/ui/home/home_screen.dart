import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/simple_mensa.dart';
import 'package:simple_mensa/ui/canteen/canteen_screen.dart';
import 'package:simple_mensa/ui/home/bloc/home_bloc.dart';
import 'package:simple_mensa/ui/home/bloc/home_event.dart';
import 'package:simple_mensa/ui/home/bloc/home_state.dart';
import 'package:simple_mensa/ui/home/widget/canteen_card.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_error.dart';
import 'package:simple_mensa/ui/widget/simple_progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) =>
          HomeBloc(mensaRepository: context.read<MensaRepository>())
            ..add(HomeLoadData()),
      child: Scaffold(
          appBar: const SimpleAppBar(
            title: SimpleMensa.title,
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: _buildBody)));

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state is HomeDataLoaded) {
      return _buildCanteenList(context, state.canteens);
    } else if (state is HomeLoading) {
      return const SimpleProgressIndicator();
    } else {
      return const SimpleError(
        message: 'Something went wrong',
      );
    }
  }

  Widget _buildCanteenList(BuildContext context, List<Canteen> canteens) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      itemCount: canteens.length,
      itemBuilder: (context, index) => CanteenCard(
        canteen: canteens[index],
        onTap: () {
          Navigator.of(context).push(PageTransition(
              child: CanteenScreen(canteen: canteens[index]),
              type: PageTransitionType.fade));
        },
      ),
    );
  }
}
