import 'package:flutter/material.dart';
import 'package:kwik_kenya/home_view/user_greeting.dart';
import 'package:kwik_kenya/home_view/widgets/completed_trainings_list.dart';
import 'package:kwik_kenya/training_view/training_detail_page.dart';
import '../styles/app_theme.dart';
import 'package:intl/intl.dart';
import '../models/training.dart';
import '../services/training_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Training? trainingOfDay;

  @override
  void initState() {
    super.initState();
    _loadTrainingOfDay();
  }

  Future<void> _loadTrainingOfDay() async {
    final training = await TrainingService.getRandomTraining();
    setState(() {
      trainingOfDay = training;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.brutalBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const UserGreeting(),
              const SizedBox(height: 19),

              // Секция с датой и тренировкой дня - делаем более агрессивной
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.neonPink, width: 4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: AppTheme.electricBlue,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: AppTheme.neonPink,
                            child: Text(
                              DateFormat('dd').format(DateTime.now()),
                              style: TextStyle(
                                color: AppTheme.brutalWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            DateFormat('MMMM yyyy').format(DateTime.now()),
                            style: TextStyle(
                              color: AppTheme.brutalBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      color: AppTheme.brutalYellow,
                      child: Text(
                        'TRAINING OF THE DAY',
                        style: TextStyle(
                          color: AppTheme.brutalBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Карточка тренировки дня - делаем более дерзкой
              if (trainingOfDay != null)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TrainingDetailPage(
                              title: trainingOfDay!.title,
                              imageUrl: trainingOfDay!.imageUrl,
                              category: trainingOfDay!.category,
                              trainingId: trainingOfDay!.id.toString(),
                            ),
                      ),
                    );
                  },
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.electricBlue,
                        width: 4,
                      ),
                      color: AppTheme.brutalBlack,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                trainingOfDay!.imageUrl,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      AppTheme.brutalBlack.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: AppTheme.neonPink,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  trainingOfDay!.title.toUpperCase(),
                                  style: TextStyle(
                                    color: AppTheme.brutalWhite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppTheme.brutalWhite,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 20),
              // Заголовок для завершенных тренировок
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: AppTheme.electricBlue,
                child: GestureDetector(
                  onTap: () async {
                    final completedTrainings =
                        await TrainingService.getCompletedTrainings();
                    if (context.mounted) {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => CompletedTrainingsList(
                              trainings: completedTrainings,
                            ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COMPLETED WORKOUTS',
                        style: TextStyle(
                          color: AppTheme.brutalBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.brutalBlack,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
