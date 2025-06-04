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
  final int currentIndex;
  final double appBarOpacity;
  final bool showFloatingAd;
  final Offset? floatingAdPosition;
  final int currentBannerIndex;
  final bool isNavMenuOpen;

  const MovieState({
    this.selectedTab = MovieTab.nowShowing,
    this.nowShowingMovies = const [],
    this.upcomingMovies = const [],
    this.selectedNowShowingMovie,
    this.selectedUpcomingMovie,
    this.currentIndex = 0,
    this.appBarOpacity = 0.0,
    this.showFloatingAd = true,
    this.isNavMenuOpen = false,
    this.floatingAdPosition,
    this.currentBannerIndex = 0,
  });

  Movie? get selectedMovie =>
      selectedTab == MovieTab.nowShowing
          ? selectedNowShowingMovie
          : selectedUpcomingMovie;

  List<Movie> get currentMovies =>
      selectedTab == MovieTab.nowShowing ? nowShowingMovies : upcomingMovies;

  MovieState copyWith({
    MovieTab? selectedTab,
    List<Movie>? nowShowingMovies,
    List<Movie>? upcomingMovies,
    Movie? selectedNowShowingMovie,
    Movie? selectedUpcomingMovie,
    int? currentIndex,
    double? appBarOpacity,
    bool? showFloatingAd,
    Offset? floatingAdPosition,
    int? currentBannerIndex,
    bool? isNavMenuOpen,
  }) {
    return MovieState(
      selectedTab: selectedTab ?? this.selectedTab,
      nowShowingMovies: nowShowingMovies ?? this.nowShowingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      selectedNowShowingMovie:
          selectedNowShowingMovie ?? this.selectedNowShowingMovie,
      selectedUpcomingMovie:
          selectedUpcomingMovie ?? this.selectedUpcomingMovie,
      currentIndex: currentIndex ?? this.currentIndex,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
      showFloatingAd: showFloatingAd ?? this.showFloatingAd,
      floatingAdPosition: floatingAdPosition ?? this.floatingAdPosition,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      isNavMenuOpen: isNavMenuOpen ?? this.isNavMenuOpen,
    );
  }

  @override
  List<Object?> get props => [
    selectedTab,
    nowShowingMovies,
    upcomingMovies,
    selectedNowShowingMovie,
    selectedUpcomingMovie,
    currentIndex,
    appBarOpacity,
    showFloatingAd,
    floatingAdPosition,
    currentBannerIndex,
    isNavMenuOpen,
  ];
}
