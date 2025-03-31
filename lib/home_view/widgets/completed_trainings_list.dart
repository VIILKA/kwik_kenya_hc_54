import 'package:flutter/material.dart';
import '../../models/training.dart';
import '../../training_view/training_detail_page.dart';
import '../../styles/app_theme.dart';

class CompletedTrainingsList extends StatelessWidget {
  final List<Training> trainings;

  const CompletedTrainingsList({required this.trainings, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 163 / 180,
            ),
            itemCount: trainings.length,
            itemBuilder: (context, index) {
              final training = trainings[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => TrainingDetailPage(
                            title: training.title,
                            imageUrl: training.imageUrl,
                            category: training.category,
                            trainingId: training.id.toString(),
                          ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.brutalBlack,
                    border: Border.all(color: AppTheme.electricBlue, width: 3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          training.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: AppTheme.neonPink,
                        child: Text(
                          training.title.toUpperCase(),
                          style: TextStyle(
                            color: AppTheme.brutalWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
