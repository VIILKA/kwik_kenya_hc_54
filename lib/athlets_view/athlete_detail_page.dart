import 'package:flutter/material.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class AthleteDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String position;
  final String achievements;
  final List<String> favoriteExercises;

  const AthleteDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.position,
    required this.achievements,
    required this.favoriteExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя панель
            Container(
              height: 85,
              color: AppTheme.electricBlue,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: AppTheme.neonPink,
                            child: Icon(
                              Icons.arrow_back,
                              color: AppTheme.brutalWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'ABOUT ATHLETES',
                          style: TextStyle(
                            color: AppTheme.brutalBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Основной контент
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.brutalBlack,
                          border: Border.all(
                            color: AppTheme.electricBlue,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.electricBlue,
                              offset: const Offset(4, 4),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: AppTheme.electricBlue,
                              offset: const Offset(-4, -4),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              imageUrl,
                              height: 288,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              color: AppTheme.neonPink,
                              child: Text(
                                name.toUpperCase(),
                                style: TextStyle(
                                  color: AppTheme.brutalWhite,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.brutalBlack,
                          border: Border.all(
                            color: AppTheme.electricBlue,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSection('POSITION', position.toUpperCase()),
                            const SizedBox(height: 20),
                            _buildSection('ACHIEVEMENTS', achievements),
                            const SizedBox(height: 20),
                            Text(
                              'FAVORITE EXERCISES',
                              style: TextStyle(
                                color: AppTheme.electricBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...favoriteExercises.map(
                              (exercise) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '• ${exercise.toUpperCase()}',
                                  style: TextStyle(
                                    color: AppTheme.brutalWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppTheme.electricBlue,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            color: AppTheme.brutalWhite,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
