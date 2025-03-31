import 'package:flutter/material.dart';
import 'package:kwik_kenya/training_view/training_detail_page.dart';
import '../styles/app_theme.dart';
import 'widgets/training_card.dart';
import 'widgets/training_filter_chip.dart';
import '../models/training.dart';
import '../services/training_service.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  String selectedFilter = 'Diagonal';
  bool isLoading = true;
  bool isCategoryLocked = false;
  String? unlockRequirements;

  @override
  void initState() {
    super.initState();
    _checkCategoryLock();
  }

  Future<void> _checkCategoryLock() async {
    final isUnlocked = await TrainingService.canUnlockCategory(selectedFilter);
    setState(() {
      isCategoryLocked = !isUnlocked;
      isLoading = false;
    });
  }

  // Добавим метод для обновления UI после завершения тренировки
  Future<void> _onTrainingCompleted(Training training) async {
    await TrainingService.markTrainingAsCompleted(training.id);
    // Перепроверяем блокировку категории
    await _checkCategoryLock();
    // Обновляем состояние для перерисовки списка
    setState(() {});
  }

  void _onCategoryChanged(String category) async {
    setState(() {
      selectedFilter = category;
      isLoading = true;
    });
    await _checkCategoryLock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Верхний индикатор
            Container(
              height: 70,
              color: AppTheme.electricBlue,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TRAININGS',
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

            // Фильтры категорий
            Container(
              height: 60,
              color: AppTheme.brutalBlack,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    [
                      'Diagonal',
                      'Binder',
                      'Libero',
                      'Center Blocker',
                      'Doping Player',
                    ].map((category) {
                      final isSelected = category == selectedFilter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TrainingFilterChip(
                          label: category,
                          isSelected: isSelected,
                          onTap: () => _onCategoryChanged(category),
                        ),
                      );
                    }).toList(),
              ),
            ),

            // Список тренировок
            if (isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: AppTheme.neonPink),
                ),
              )
            else
              Expanded(
                child: FutureBuilder<List<Training>>(
                  future: TrainingService.getTrainingsByCategory(
                    selectedFilter,
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: AppTheme.neonPink,
                          child: Text(
                            'LOADING...',
                            style: TextStyle(
                              color: AppTheme.brutalWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      );
                    }

                    final trainings = snapshot.data!;

                    if (trainings.isEmpty) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: AppTheme.electricBlue,
                          child: Text(
                            'NO TRAININGS HERE',
                            style: TextStyle(
                              color: AppTheme.brutalBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: trainings.length,
                      itemBuilder: (context, index) {
                        final training = trainings[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TrainingCard(
                            title: training.title,
                            imageUrl: training.imageUrl,
                            isLocked: isCategoryLocked,
                            onTap:
                                isCategoryLocked
                                    ? null
                                    : () async {
                                      await _onTrainingCompleted(training);
                                      if (context.mounted) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => TrainingDetailPage(
                                                  title: training.title,
                                                  imageUrl: training.imageUrl,
                                                  category: selectedFilter,
                                                  trainingId:
                                                      training.id.toString(),
                                                ),
                                          ),
                                        );
                                      }
                                    },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
