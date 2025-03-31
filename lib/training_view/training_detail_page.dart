import 'package:flutter/material.dart';
import 'package:kwik_kenya/models/training.dart';
import 'package:path/path.dart';
import 'package:kwik_kenya/services/sign_up_services.dart';
import '../styles/app_theme.dart';
import 'package:hive/hive.dart';

class TrainingDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String category;
  final String trainingId;

  const TrainingDetailPage({
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.trainingId,
    super.key,
  });

  @override
  State<TrainingDetailPage> createState() => _TrainingDetailPageState();
}

class _TrainingDetailPageState extends State<TrainingDetailPage> {
  Training? _training;

  @override
  void initState() {
    super.initState();
    _loadTrainingDetails();
  }

  Future<void> _loadTrainingDetails() async {
    final box = await Hive.openBox<Training>('trainings');
    final training = box.get(int.parse(widget.trainingId));
    if (mounted) {
      setState(() {
        _training = training;
      });
    }
  }

  Future<void> _completeTraining() async {
    await SharedPrefsService.markTrainingCompleted(
      widget.category,
      widget.trainingId,
    );
    if (mounted) {
      ScaffoldMessenger.of(
        context as BuildContext,
      ).showSnackBar(const SnackBar(content: Text('Training completed!')));
    }
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
              height: 85,
              color: AppTheme.electricBlue,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Заголовок и кнопка назад
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
                        Expanded(
                          child: Text(
                            widget.title.toUpperCase(),
                            style: TextStyle(
                              color: AppTheme.brutalBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
                              widget.imageUrl,
                              height: 290,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              color: AppTheme.neonPink,
                              child: Text(
                                widget.category.toUpperCase(),
                                style: TextStyle(
                                  color: AppTheme.brutalWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (_training != null)
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.brutalBlack,
                            border: Border.all(
                              color: AppTheme.electricBlue,
                              width: 3,
                            ),
                          ),
                          child: Text(
                            _training!.description,
                            style: TextStyle(
                              color: AppTheme.brutalWhite,
                              fontSize: 16,
                              height: 1.5,
                            ),
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
}
