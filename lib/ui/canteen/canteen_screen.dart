import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_bloc.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_event.dart';
import 'package:simple_mensa/ui/canteen/bloc/canteen_state.dart';
import 'package:simple_mensa/ui/canteen/widget/meal_card.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_error.dart';
import 'package:simple_mensa/ui/widget/simple_progress_indicator.dart';
import 'package:simple_mensa/util/constants.dart';
import 'package:simple_mensa/util/date_time_util.dart';

class CanteenScreen extends StatelessWidget {
  const CanteenScreen({super.key, required this.canteen});

  final Canteen canteen;
  static const days = 3;

  @override
  Widget build(BuildContext context) {
    final dateTimeList = DateTimeUtil.buildDateTimeList(days);
    return DefaultTabController(
      length: dateTimeList.length,
      child: Scaffold(
        appBar: SimpleAppBar(
          title: canteen.name,
          height: 92,
          bottom: TabBar(
            labelStyle: const TextStyle(fontSize: 16),
            labelColor: Colors.white,
            indicatorColor: Colors.purpleAccent,
            unselectedLabelColor: Colors.grey,
            tabs: dateTimeList
                .map((dateTime) => Tab(
                      child: Text(DateFormat(Constants.germanDateFormat)
                          .format(dateTime)),
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
            children:
                dateTimeList.map((dateTime) => _buildBody(dateTime)).toList()),
      ),
    );
  }

  Widget _buildBody(DateTime dateTime) {
    return BlocProvider(
      create: (context) =>
          CanteenBloc(mensaRepository: context.read<MensaRepository>())
            ..add(CanteenLoadData(canteen: canteen, dateTime: dateTime)),
      child: BlocBuilder<CanteenBloc, CanteenState>(
          builder: (BuildContext context, CanteenState state) {
        if (state is CanteenLoading) {
          return const SimpleProgressIndicator();
        } else if (state is CanteenDataLoaded) {
          return _buildMealList(state.meals);
        } else {
          return const SimpleError(message: 'No meals today.');
        }
      }),
    );
  }

  Widget _buildMealList(List<Meal> meals) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        itemCount: meals.length,
        itemBuilder: (context, index) => MealCard(meal: meals[index]));
  }
}
