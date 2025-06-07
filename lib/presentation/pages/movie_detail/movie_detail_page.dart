import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../data/models/movie/movie_model.dart';
import 'movie_trailer_page.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.bannerUrl,
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
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => MovieTrailerPage(
                                  trailerUrl: movie.trailerUrl,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 48.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    '${movie.genre.join(', ')} • ${movie.duration}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Gap(16.h),
                  Text(
                    "Nội dung",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    movie.description,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Gap(16.h),
                  _buildInfoRow(
                    'Khởi chiếu',
                    movie.releaseDate.toLocal().toString().split(' ')[0],
                  ),
                  _buildInfoRow('Phân loại', movie.ageRating),
                  _buildInfoRow('Ngôn ngữ', movie.language),
                  _buildInfoRow('Định dạng', movie.format.join(', ')),
                  Gap(16.h),
                  Divider(color: Colors.grey.shade800, thickness: 1),
                  Gap(16.h),
                  _buildInfoRow('Đạo diễn', movie.director),
                  _buildInfoRow('Diễn viên', movie.cast.join(', ')),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          movie.isNowShowing
              ? Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.black,
                child: SizedBox(
                  width: double.infinity,
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
                    child: const Text(
                      'Đặt vé',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
              : null,
      backgroundColor: Colors.black,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
