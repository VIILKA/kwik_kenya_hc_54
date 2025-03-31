import 'package:hive_flutter/hive_flutter.dart';
import '../models/training.dart';
import 'dart:math';

class TrainingService {
  static const String boxName = 'trainings';

  // Инициализация Hive и добавление начальных данных
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TrainingAdapter());

    final box = await Hive.openBox<Training>(boxName);

    if (box.isEmpty) {
      await _addInitialTrainings(box);
    }
  }

  // Добавление начальных тренировок
  static Future<void> _addInitialTrainings(Box<Training> box) async {
    final trainings = [
      // Diagonal тренировки
      Training(
        id: 1,
        title: 'Basic Feeding Technique',
        description:
            '''Assume the stance. Stand firmly on the feet and place the supporting leg forward, feet shoulder width apart, body straight. The server's gaze is fixed on the volleyball court, thus choosing the direction of the ball's flight.

Ball preparation. The hand with the ball in the palm of the hand is extended forward and slightly upwards at face level. The ball is in the player's field of vision. The hitting arm is bent at the elbow and placed behind the back.

Aim. Look for the most vulnerable spot or weakest receiver on the opposite side of the court and aim the ball there.''',
        imageUrl: 'assets/images/train1.png',
        category: 'Diagonal',
      ),
      Training(
        id: 2,
        title: 'Advanced Attack Technique',
        description:
            '''Master the perfect spike with this advanced technique. Focus on timing, approach, and explosive power.

Key points:
- Three-step approach
- Arm swing mechanics
- Jump timing
- Ball contact point
- Landing technique''',
        imageUrl: 'assets/images/train2.png',
        category: 'Diagonal',
      ),
      Training(
        id: 3,
        title: 'Quick Attack Training',
        description:
            '''Learn to execute fast attacks that catch the opponent off guard. This training focuses on rapid movement and decision-making.

Practice includes:
- Quick set recognition
- Fast approach
- Timing adjustments
- Multiple attack options''',
        imageUrl: 'assets/images/train3.png',
        category: 'Diagonal',
      ),

      // Binder тренировки
      Training(
        id: 4,
        title: 'Setting Fundamentals',
        description:
            '''Master the basics of setting with proper hand positioning and ball control. Focus on consistency and accuracy.

Key elements:
- Hand formation
- Ball contact
- Follow-through
- Target practice''',
        imageUrl: 'assets/images/train4.png',
        category: 'Binder',
      ),
      Training(
        id: 5,
        title: 'Jump Setting Skills',
        description:
            '''Advanced setting techniques including jump sets and quick sets. Learn to deceive opponents and create opportunities.

Training includes:
- Jump timing
- Ball handling in air
- Direction control
- Speed variation''',
        imageUrl: 'assets/images/train5.png',
        category: 'Binder',
      ),
      Training(
        id: 6,
        title: 'Back Set Training',
        description:
            '''Perfect your back setting technique for more versatile play. Focus on awareness and precision.

Practice points:
- Body positioning
- Spatial awareness
- Consistent height
- Target accuracy''',
        imageUrl: 'assets/images/train6.png',
        category: 'Binder',
      ),

      // Libero тренировки
      Training(
        id: 7,
        title: 'Defense Positioning',
        description:
            '''Learn optimal court positioning for different game situations. Master the art of reading attacks.

Focus areas:
- Court coverage
- Movement patterns
- Attack reading
- Quick reactions''',
        imageUrl: 'assets/images/train7.png',
        category: 'Libero',
      ),
      Training(
        id: 8,
        title: 'Diving Techniques',
        description:
            '''Master various diving techniques to save difficult balls. Learn to recover quickly after dives.

Key skills:
- Forward dive
- Side dive
- Rolling technique
- Quick recovery''',
        imageUrl: 'assets/images/train1.png',
        category: 'Libero',
      ),
      Training(
        id: 9,
        title: 'Serve Reception',
        description:
            '''Perfect your serve reception technique. Focus on platform control and movement.

Training includes:
- Platform stability
- Foot movement
- Ball control
- Communication''',
        imageUrl: 'assets/images/train2.png',
        category: 'Libero',
      ),

      // Center Blocker тренировки (заблокированы изначально)
      Training(
        id: 10,
        title: 'Basic Blocking',
        description:
            '''Learn fundamental blocking techniques and timing. Master the basics of net defense.

Key elements:
- Hand positioning
- Jump timing
- Net awareness
- Lateral movement''',
        imageUrl: 'assets/images/train3.png',
        category: 'Center Blocker',
        isLocked: true,
      ),
      Training(
        id: 11,
        title: 'Quick Attack Defense',
        description:
            '''Develop skills to defend against quick attacks. Focus on reading and reaction time.

Practice includes:
- Read and react
- Quick movement
- Block positioning
- Team coordination''',
        imageUrl: 'assets/images/train4.png',
        category: 'Center Blocker',
        isLocked: true,
      ),

      // Doping Player тренировки (заблокированы изначально)
      Training(
        id: 12,
        title: 'Power Serve Training',
        description:
            '''Master the power serve technique. Focus on generating maximum power while maintaining control.

Key points:
- Toss consistency
- Contact point
- Power generation
- Direction control''',
        imageUrl: 'assets/images/train5.png',
        category: 'Doping Player',
        isLocked: true,
      ),
      Training(
        id: 13,
        title: 'Jump Serve Mastery',
        description:
            '''Advanced jump serve techniques for competitive play. Learn to combine power and precision.

Training focus:
- Approach rhythm
- Toss placement
- Impact technique
- Landing control''',
        imageUrl: 'assets/images/train6.png',
        category: 'Doping Player',
        isLocked: true,
      ),
      Training(
        id: 14,
        title: 'Attack Combinations',
        description:
            '''Learn complex attack patterns and combinations. Master different hitting techniques.

Practice includes:
- Timing variations
- Shot selection  
- Team coordination
- Deception tactics''',
        imageUrl: 'assets/images/train7.png',
        category: 'Doping Player',
        isLocked: true,
      ),
    ];

    for (var training in trainings) {
      await box.put(training.id, training);
    }
  }

  // Получить случайную тренировку дня
  static Future<Training> getRandomTraining() async {
    final box = await Hive.openBox<Training>(boxName);
    final randomIndex = Random().nextInt(box.length);
    return box.getAt(randomIndex)!;
  }

  // Получить все завершенные тренировки
  static Future<List<Training>> getCompletedTrainings() async {
    final box = await Hive.openBox<Training>(boxName);
    return box.values.where((training) => training.isCompleted).toList();
  }

  // Получить тренировки по категории
  static Future<List<Training>> getTrainingsByCategory(String category) async {
    final box = await Hive.openBox<Training>(boxName);
    final isUnlocked = await canUnlockCategory(category);

    return box.values
        .where((training) => training.category == category)
        .map(
          (training) => Training(
            id: training.id,
            title: training.title,
            description: training.description,
            imageUrl: training.imageUrl,
            category: training.category,
            isLocked: !isUnlocked,
            isCompleted: training.isCompleted,
          ),
        )
        .toList();
  }

  // Отметить тренировку как завершенную
  static Future<void> markTrainingAsCompleted(int id) async {
    final box = await Hive.openBox<Training>(boxName);
    final training = box.get(id);
    if (training != null) {
      print('Marking training ${training.title} (ID: $id) as completed');
      training.isCompleted = true;
      await training.save();
      print('Training saved successfully');
    } else {
      print('Training with ID $id not found');
    }
  }

  // Проверить прогресс для категории
  static Future<double> getCategoryProgress(String category) async {
    final box = await Hive.openBox<Training>(boxName);
    final trainings = box.values.where((t) => t.category == category).toList();

    if (trainings.isEmpty) {
      print('No trainings found for category: $category');
      return 0;
    }

    final completed = trainings.where((t) => t.isCompleted).length;
    print(
      'Category: $category, Completed: $completed, Total: ${trainings.length}',
    );

    return completed / trainings.length;
  }

  // Проверить доступность категории
  static Future<bool> canUnlockCategory(String category) async {
    final box = await Hive.openBox<Training>(boxName);

    switch (category) {
      case 'Center Blocker':
        final diagonalTrainings =
            box.values
                .where((training) => training.category == 'Diagonal')
                .toList();

        if (diagonalTrainings.isEmpty) return false;

        final completedCount =
            diagonalTrainings.where((training) => training.isCompleted).length;

        print(
          'Diagonal completed: $completedCount/${diagonalTrainings.length}',
        );
        return completedCount == diagonalTrainings.length;

      case 'Doping Player':
        final binderTrainings =
            box.values
                .where((training) => training.category == 'Binder')
                .toList();
        final liberoTrainings =
            box.values
                .where((training) => training.category == 'Libero')
                .toList();

        if (binderTrainings.isEmpty || liberoTrainings.isEmpty) return false;

        final binderCompleted =
            binderTrainings.where((training) => training.isCompleted).length;
        final liberoCompleted =
            liberoTrainings.where((training) => training.isCompleted).length;

        return binderCompleted == binderTrainings.length &&
            liberoCompleted == liberoTrainings.length;

      default:
        return true;
    }
  }

  // Получить информацию о требованиях для разблокировки
  static Future<String> getUnlockRequirements(String category) async {
    switch (category) {
      case 'Center Blocker':
        final progress = await getCategoryProgress('Diagonal');
        final percentage = (progress * 100).toInt();
        return 'Complete 80% of Diagonal trainings ($percentage% done)';

      case 'Doping Player':
        final binderProgress = await getCategoryProgress('Binder');
        final liberoProgress = await getCategoryProgress('Libero');
        final binderPercentage = (binderProgress * 100).toInt();
        final liberoPercentage = (liberoProgress * 100).toInt();
        return 'Complete 70% of Binder ($binderPercentage%) and Libero ($liberoPercentage%) trainings';

      default:
        return '';
    }
  }
}
