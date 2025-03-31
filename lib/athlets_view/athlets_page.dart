import 'package:flutter/material.dart';
import 'package:kwik_kenya/athlets_view/athlete_detail_page.dart';
import 'package:kwik_kenya/styles/app_theme.dart';

class AthletsPage extends StatefulWidget {
  const AthletsPage({super.key});

  @override
  State<AthletsPage> createState() => _AthletsPageState();
}

class _AthletsPageState extends State<AthletsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Индикатор и заголовок
            Container(
              height: 70,
              color: AppTheme.electricBlue,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ATHLETES',
                    style: TextStyle(
                      color: AppTheme.brutalBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppTheme.neonPink,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
            ),

            // Список атлетов
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: const [
                    SizedBox(height: 16),
                    AthleteCard(
                      name: 'Gilberto Amauri',
                      imageUrl: 'assets/images/gilberto.png',
                      position: 'Opposite Hitter',
                      achievements:
                          'The winner of gold and bronze at the Olympic Games...',
                      favoriteExercises: [
                        'Serving the ball',
                        'Lower ball reception',
                        'Overhead pass',
                        'High block',
                      ],
                    ),
                    SizedBox(height: 9),
                    AthleteCard(
                      name: 'Saori Kimura',
                      imageUrl: 'assets/images/saori.png',
                      position: 'Outside Hitter',
                      achievements: 'Three-time Olympic medalist...',
                      favoriteExercises: [
                        'Spike training',
                        'Defensive positioning',
                        'Jump serve',
                        'Quick attacks',
                      ],
                    ),
                    SizedBox(height: 9),
                    AthleteCard(
                      name: 'Maxim Mikhailov',
                      imageUrl: 'assets/images/mikhail.png',
                      position: 'Opposite Hitter',
                      achievements:
                          'The winner of gold and bronze at the Olympic Games...',
                      favoriteExercises: [
                        'Serving the ball',
                        'Lower ball reception',
                        'Overhead pass',
                        'High block',
                      ],
                    ),
                    SizedBox(height: 9),
                    AthleteCard(
                      name: 'Sergio Santos',
                      imageUrl: 'assets/images/sergio.png',
                      position: 'Middle Blocker',
                      achievements:
                          'The winner of gold and bronze at the Olympic Games...',
                      favoriteExercises: [
                        'Serving the ball',
                        'Lower ball reception',
                        'Overhead pass',
                        'High block',
                      ],
                    ),
                    SizedBox(height: 9),
                    AthleteCard(
                      name: 'Yuji Nishida',
                      imageUrl: 'assets/images/yuji.png',
                      position: 'Setter',
                      achievements:
                          'The winner of gold and bronze at the Olympic Games...',
                      favoriteExercises: [
                        'Serving the ball',
                        'Lower ball reception',
                        'Overhead pass',
                        'High block',
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AthleteCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String position;
  final String achievements;
  final List<String> favoriteExercises;

  const AthleteCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.position,
    required this.achievements,
    required this.favoriteExercises,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => AthleteDetailPage(
                  name: name,
                  imageUrl: imageUrl,
                  position: position,
                  achievements: achievements,
                  favoriteExercises: favoriteExercises,
                ),
          ),
        );
      },
      child: Container(
        height: 288,
        decoration: BoxDecoration(
          color: AppTheme.brutalBlack,
          border: Border.all(color: AppTheme.electricBlue, width: 3),
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
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.brutalBlack.withOpacity(0.7),
                    AppTheme.brutalBlack.withOpacity(0.3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: TextStyle(
                          color: AppTheme.brutalWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                      Container(
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          color: AppTheme.neonPink,
                          border: Border.all(
                            color: AppTheme.brutalWhite,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppTheme.brutalWhite,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
