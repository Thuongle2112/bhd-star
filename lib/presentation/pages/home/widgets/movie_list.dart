import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/l10n/locale_keys.g.dart';
import '../../../../core/utils/constants/app_assets_svg.dart';
import '../../../../data/models/movie/movie_model.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movies;
  final Movie? selectedMovie;
  final Function(Movie) onMovieSelected;
  final Color Function(String) getAgeRatingColor;

  const MovieList({
    super.key,
    required this.movies,
    this.selectedMovie,
    required this.onMovieSelected,
    required this.getAgeRatingColor,
  });

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.movies.length,
      viewportFraction: 0.65,
    );
  }

  @override
  void didUpdateWidget(MovieList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.movies != oldWidget.movies ||
        widget.selectedMovie != oldWidget.selectedMovie) {
      final newIndex =
          widget.selectedMovie != null
              ? widget.movies.indexOf(widget.selectedMovie!)
              : 0;

      if (_pageController.hasClients) {
        _pageController.jumpToPage(newIndex + widget.movies.length);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'Không có phim để hiển thị',
            style: TextStyle(color: Colors.white54),
          ),
        ),
      );
    }

    // Nhân đôi danh sách phim để tạo hiệu ứng cuộn vô hạn
    final infiniteMovies = [...widget.movies, ...widget.movies];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            itemCount: infiniteMovies.length,
            onPageChanged: (index) {
              final actualIndex = index % widget.movies.length;

              if (index == 0) {
                _pageController.jumpToPage(widget.movies.length);
              } else if (index == infiniteMovies.length - 1) {
                _pageController.jumpToPage(widget.movies.length - 1);
              }

              setState(() {
                _currentIndex = actualIndex;
              });
              widget.onMovieSelected(widget.movies[actualIndex]);
            },
            itemBuilder: (context, index) {
              final actualIndex = index % widget.movies.length;
              final isCenter = actualIndex == _currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuint,
                margin: EdgeInsets.symmetric(
                  vertical: isCenter ? 10 : 40,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:
                      isCenter
                          ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 8,
                            ),
                          ]
                          : [],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.movies[actualIndex].posterUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),

        if (widget.selectedMovie != null)
          _buildMovieInfo(widget.selectedMovie!),
      ],
    );
  }

  Widget _buildMovieInfo(Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time, color: Colors.grey, size: 14),
              const SizedBox(width: 4),
              Text(
                '${movie.duration} - ${movie.genreString}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          if (movie.isNowShowing) const SizedBox(height: 16),
          if (movie.isNowShowing)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8BC34A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.bookingIcon,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    Gap(8),
                    Text(
                      LocaleKeys.booking.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
