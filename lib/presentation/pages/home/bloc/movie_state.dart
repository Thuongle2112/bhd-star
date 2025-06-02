import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../../data/models/movie/movie_model.dart';

enum MovieTab { nowShowing, upcoming }

class MovieState extends Equatable {
  final MovieTab selectedTab;
  final List<Movie> nowShowingMovies;
  final List<Movie> upcomingMovies;
  final Movie? selectedNowShowingMovie;
  final Movie? selectedUpcomingMovie;
  final double appBarOpacity;
  final bool showFloatingAd;
  final Offset? floatingAdPosition;
  final int currentBannerIndex;

  const MovieState({
    this.selectedTab = MovieTab.nowShowing,
    this.nowShowingMovies = const [],
    this.upcomingMovies = const [],
    this.selectedNowShowingMovie,
    this.selectedUpcomingMovie,
    this.appBarOpacity = 0.0,
    this.showFloatingAd = true,
    this.floatingAdPosition,
    this.currentBannerIndex = 0,
  });

  MovieState copyWith({
    MovieTab? selectedTab,
    List<Movie>? nowShowingMovies,
    List<Movie>? upcomingMovies,
    Movie? selectedNowShowingMovie,
    Movie? selectedUpcomingMovie,
    double? appBarOpacity,
    bool? showFloatingAd,
    Offset? floatingAdPosition,
    int? currentBannerIndex,
  }) {
    return MovieState(
      selectedTab: selectedTab ?? this.selectedTab,
      nowShowingMovies: nowShowingMovies ?? this.nowShowingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      selectedNowShowingMovie:
          selectedNowShowingMovie ?? this.selectedNowShowingMovie,
      selectedUpcomingMovie:
          selectedUpcomingMovie ?? this.selectedUpcomingMovie,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
      showFloatingAd: showFloatingAd ?? this.showFloatingAd,
      floatingAdPosition: floatingAdPosition ?? this.floatingAdPosition,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
    );
  }

  Movie? get selectedMovie {
    return selectedTab == MovieTab.nowShowing
        ? selectedNowShowingMovie
        : selectedUpcomingMovie;
  }

  List<Movie> get currentMovies {
    return selectedTab == MovieTab.nowShowing
        ? nowShowingMovies
        : upcomingMovies;
  }

  @override
  List<Object?> get props => [
    selectedTab,
    nowShowingMovies,
    upcomingMovies,
    selectedNowShowingMovie,
    selectedUpcomingMovie,
    appBarOpacity,
    showFloatingAd,
    floatingAdPosition,
    currentBannerIndex,
  ];
}
