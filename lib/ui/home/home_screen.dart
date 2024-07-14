import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/repository/mensa_repository.dart';
import 'package:simple_mensa/extension/build_context_extension.dart';
import 'package:simple_mensa/simple_mensa.dart';
import 'package:simple_mensa/ui/canteen/canteen_screen.dart';
import 'package:simple_mensa/ui/home/bloc/home_bloc.dart';
import 'package:simple_mensa/ui/home/bloc/home_event.dart';
import 'package:simple_mensa/ui/home/bloc/home_state.dart';
import 'package:simple_mensa/ui/home/widget/canteen_card.dart';
import 'package:simple_mensa/ui/widget/simple_app_bar.dart';
import 'package:simple_mensa/ui/widget/simple_drawer.dart';
import 'package:simple_mensa/ui/widget/simple_error.dart';
import 'package:simple_mensa/ui/widget/simple_progress_indicator.dart';
import 'package:simple_mensa/ui/widget/simple_refresh_indicator.dart';

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
          drawer: const SimpleDrawer(
            selectedIndex: 0,
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: _buildBody)));

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state is HomeDataLoaded) {
      return _buildCanteenList(context, state.canteens);
    } else if (state is HomeLoading) {
      return const SimpleProgressIndicator();
    } else {
      return _buildErrorMessage(context);
    }
  }

  Widget _buildCanteenList(BuildContext context, List<Canteen> canteens) {
    return SimpleRefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(HomeLoadData());
      },
      child: ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: canteens.length,
        itemBuilder: (context, index) => CanteenCard(
          key: ValueKey(canteens[index].id),
          canteen: canteens[index],
          onTap: () {
            Navigator.of(context).push(PageTransition(
                child: CanteenScreen(canteen: canteens[index]),
                type: PageTransitionType.fade));
          },
        ),
        onReorder: (int oldIndex, int newIndex) {
          context.read<HomeBloc>().add(HomeOnReorder(
              oldIndex: oldIndex, newIndex: newIndex, canteens: canteens));
        },
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    return SimpleRefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(HomeLoadData());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              2 * kToolbarHeight,
          child: SimpleError(
            message: context.loc.default_error_message,
          ),
        ),
      ),
    );
  }
}
