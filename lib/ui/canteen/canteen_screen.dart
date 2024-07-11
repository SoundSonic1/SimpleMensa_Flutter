import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_bloc.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_event.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_state.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_error.dart';
import 'package:simple_mensa/ui/widget/simple_progress_indicator.dart';

class CanteenScreen extends StatelessWidget {
  const CanteenScreen({super.key, required this.canteen});

  final Canteen canteen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CanteenBloc(mensaRepository: context.read<MensaRepository>())
            ..add(CanteenLoadData(canteen: canteen)),
      child: Scaffold(
        appBar: SimpleAppBar(
          title: canteen.name,
        ),
        body: BlocBuilder<CanteenBloc, CanteenState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CanteenState state) {
    if (state is CanteenLoading) {
      return const SimpleProgressIndicator();
    } else if (state is CanteenDataLoaded) {
      return _buildMealList(context, state.meals);
    } else {
      return const SimpleError();
    }
  }

  Widget _buildMealList(BuildContext context, List<Meal> meals) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        itemCount: meals.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(meals[index].name),
            ));
  }
}
