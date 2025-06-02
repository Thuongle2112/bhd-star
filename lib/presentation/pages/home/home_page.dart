import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/fake_data/fake_movie_data.dart';
import 'bloc/movie_bloc.dart';
import 'bloc/movie_event.dart';
import 'bloc/movie_state.dart';
import 'widgets/banner_carousel.dart';
import 'widgets/tab_selection.dart';
import 'widgets/movie_list.dart';
import 'widgets/floating_ad.dart';
import 'widgets/transparent_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: BlocBuilder<MovieBloc, MovieState>(
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

                      MovieList(
                        movies: state.currentMovies,
                        selectedMovie: state.selectedMovie,
                        onMovieSelected: (movie) {
                          movieBloc.add(MovieSelectedEvent(movie));
                        },
                        getAgeRatingColor: _getAgeRatingColor,
                      ),
                    ],
                  ),
                ),

                TransparentAppBar(opacity: state.appBarOpacity),

                if (state.showFloatingAd && state.floatingAdPosition != null)
                  FloatingAd(
                    position: state.floatingAdPosition!,
                    onPositionChanged: (newPosition) {
                      movieBloc.add(
                        FloatingAdPositionChangedEvent(newPosition),
                      );
                    },
                    onClose: () {
                      movieBloc.add(FloatingAdClosedEvent());
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
