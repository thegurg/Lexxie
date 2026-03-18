import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/models/movie_model.dart';
import 'movie_card.dart';

class MovieCarousel extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool isLoading;

  const MovieCarousel({
    super.key,
    required this.title,
    required this.movies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Row(
            children: [
              // Cyberpunk accent bar
              Container(
                width: 3,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  boxShadow: [BoxShadow(color: AppTheme.primaryColor, blurRadius: 8)],
                ),
              ),
              Text(
                '// $title',
                style: const TextStyle(
                  fontFamily: 'TurretRoad',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: isLoading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppTheme.borderColor),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: movies[index]);
                  },
                ),
        ),
      ],
    );
  }
}
