import 'package:hive/hive.dart';

part 'training.g.dart';

@HiveType(typeId: 0)
class Training extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final bool isLocked;

  @HiveField(6)
  bool isCompleted;

  Training({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    this.isLocked = false,
    this.isCompleted = false,
  });
}
