import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/nav_menu/nav_menu.dart';
import '../../../data/fake_data/fake_movie_data.dart';
import 'bloc/movie_bloc.dart';
import 'bloc/movie_event.dart';
import 'bloc/movie_state.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/tab_selection.dart';
import 'widgets/movie_list.dart';
import 'widgets/transparent_app_bar.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onMenuPressed;
  const HomePage({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: BlocConsumer<MovieBloc, MovieState>(
        listenWhen:
            (previous, current) =>
                previous.isNavMenuOpen != current.isNavMenuOpen,
        listener: (context, state) {
          if (state.isNavMenuOpen) {
            onMenuPressed();
          }
        },
        builder: (context, state) {
          final movieBloc = context.read<MovieBloc>();

          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                SingleChildScrollView(
                  controller: movieBloc.scrollController,
                  child: Column(
                    children: [
                      BannerCarousel(
                        bannerImages: bannerImages,
                        currentBannerIndex: state.currentBannerIndex,
                        onPageChanged: (index) {
                          movieBloc.add(BannerChangedEvent(index));
                        },
                      ),

                      TabSelection(
                        selectedTabIndex: state.selectedTab.index,
                        onTabChanged: (index) {
                          movieBloc.add(
                            MovieTabChangedEvent(
                              index == 0
                                  ? MovieTab.nowShowing
                                  : MovieTab.upcoming,
                            ),
                          );
                        },
                      ),

                      MovieList(getAgeRatingColor: _getAgeRatingColor),
                    ],
                  ),
                ),

                BlocBuilder<MovieBloc, MovieState>(
                  buildWhen:
                      (previous, current) =>
                          previous.appBarOpacity != current.appBarOpacity,
                  builder: (context, state) {
                    return TransparentAppBar(
                      opacity: state.appBarOpacity,
                      onMenuPressed: onMenuPressed,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getAgeRatingColor(String rating) {
    switch (rating) {
      case '0+':
      case 'P':
        return Colors.green;
      case '13+':
        return Colors.orange;
      case '16+':
        return Colors.deepOrange;
      case '18+':
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
