import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../data/fake_data/fake_movie_data.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ScrollController scrollController = ScrollController();

  MovieBloc() : super(const MovieState()) {
    _registerScrollListener();

    on<MovieLoadEvent>(_onMovieLoad);
    on<MovieTabChangedEvent>(_onMovieTabChanged);
    on<MovieSelectedEvent>(_onMovieSelected);
    on<BannerChangedEvent>(_onBannerChanged);
    on<FloatingAdPositionChangedEvent>(_onFloatingAdPositionChanged);
    on<FloatingAdClosedEvent>(_onFloatingAdClosed);
    on<AppBarScrolledEvent>(_onAppBarScrolled);

    add(MovieLoadEvent());
  }

  void _registerScrollListener() {
    scrollController.addListener(() {
      add(AppBarScrolledEvent(scrollController.offset));
    });
  }

  void _onMovieLoad(MovieLoadEvent event, Emitter<MovieState> emit) {
    // Lấy dữ liệu phim từ fake_movie_data.dart
    final nowShowingMovies =
        movies.where((movie) => movie.isNowShowing).toList();
    final upcomingMovies =
        movies.where((movie) => !movie.isNowShowing).toList();

    // Chọn phim đầu tiên cho mỗi tab
    final selectedNowShowingMovie =
        nowShowingMovies.isNotEmpty ? nowShowingMovies.first : null;
    final selectedUpcomingMovie =
        upcomingMovies.isNotEmpty ? upcomingMovies.first : null;

    emit(
      state.copyWith(
        nowShowingMovies: nowShowingMovies,
        upcomingMovies: upcomingMovies,
        selectedNowShowingMovie: selectedNowShowingMovie,
        selectedUpcomingMovie: selectedUpcomingMovie,
        selectedTab: MovieTab.nowShowing,
      ),
    );
  }

  void _onMovieTabChanged(
    MovieTabChangedEvent event,
    Emitter<MovieState> emit,
  ) {
    // Cuộn lên đầu khi chuyển tab
    if (scrollController.offset > 0) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    emit(state.copyWith(selectedTab: event.tab));
  }

  void _onMovieSelected(MovieSelectedEvent event, Emitter<MovieState> emit) {
    if (state.selectedTab == MovieTab.nowShowing) {
      emit(state.copyWith(selectedNowShowingMovie: event.movie));
    } else {
      emit(state.copyWith(selectedUpcomingMovie: event.movie));
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

    // Chỉ emit state mới nếu opacity thực sự thay đổi
    if (appBarOpacity != state.appBarOpacity) {
      emit(state.copyWith(appBarOpacity: appBarOpacity));
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
