import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../data/fake_data/fake_movie_data.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ScrollController scrollController = ScrollController();
  final PageController pageController;

  MovieBloc()
    : pageController = PageController(viewportFraction: 0.65),
      super(MovieState()) {
    on<MovieLoadEvent>(_onMovieLoad);
    on<MovieTabChangedEvent>(_onMovieTabChanged);
    on<MovieChangedEvent>(_onMovieChanged);
    on<BannerChangedEvent>(_onBannerChanged);
    on<FloatingAdPositionChangedEvent>(_onFloatingAdPositionChanged);
    on<FloatingAdClosedEvent>(_onFloatingAdClosed);
    on<AppBarScrolledEvent>(_onAppBarScrolled);
    on<ToggleNavMenuEvent>(_onToggleNavMenu);

    add(MovieLoadEvent());
  }

  void _onMovieLoad(MovieLoadEvent event, Emitter<MovieState> emit) {
    final nowShowingMovies =
        movies.where((movie) => movie.isNowShowing).toList();
    final upcomingMovies =
        movies.where((movie) => !movie.isNowShowing).toList();

    emit(
      state.copyWith(
        nowShowingMovies: nowShowingMovies,
        upcomingMovies: upcomingMovies,
        selectedNowShowingMovie:
            nowShowingMovies.isNotEmpty ? nowShowingMovies[0] : null,
        selectedUpcomingMovie:
            upcomingMovies.isNotEmpty ? upcomingMovies[0] : null,
      ),
    );
  }

  void _onMovieTabChanged(
    MovieTabChangedEvent event,
    Emitter<MovieState> emit,
  ) {
    emit(
      state.copyWith(
        selectedTab: event.tab,
        currentIndex: 0, // Reset index khi chuyển tab
      ),
    );
  }

  void _onMovieChanged(MovieChangedEvent event, Emitter<MovieState> emit) {
    if (state.selectedTab == MovieTab.nowShowing) {
      emit(
        state.copyWith(
          currentIndex: event.index,
          selectedNowShowingMovie: event.movie,
        ),
      );
    } else {
      emit(
        state.copyWith(
          currentIndex: event.index,
          selectedUpcomingMovie: event.movie,
        ),
      );
    }
  }

  void _onBannerChanged(BannerChangedEvent event, Emitter<MovieState> emit) {
    emit(state.copyWith(currentBannerIndex: event.index));
  }

  void _onFloatingAdPositionChanged(
    FloatingAdPositionChangedEvent event,
    Emitter<MovieState> emit,
  ) {
    emit(state.copyWith(floatingAdPosition: event.position));
  }

  void _onFloatingAdClosed(
    FloatingAdClosedEvent event,
    Emitter<MovieState> emit,
  ) {
    emit(state.copyWith(showFloatingAd: false));
  }

  void _onAppBarScrolled(AppBarScrolledEvent event, Emitter<MovieState> emit) {
    final appBarOpacity =
        event.scrollOffset < 100 ? event.scrollOffset / 100 : 1.0;

    if (appBarOpacity != state.appBarOpacity) {
      emit(state.copyWith(appBarOpacity: appBarOpacity));
    }
  }

  void _onToggleNavMenu(ToggleNavMenuEvent event, Emitter<MovieState> emit) {
    emit(state.copyWith(isNavMenuOpen: event.isOpen));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    pageController.dispose();
    return super.close();
  }
}
