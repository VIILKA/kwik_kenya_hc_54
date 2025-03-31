import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class SharedPrefsService {
  // Ключи
  static const _kIsLoggedIn = 'is_logged_in';

  static const _kSavedFirstName = 'user_firstName';
  static const _kSavedLastName = 'user_lastName';
  static const _kSavedAge = 'user_age';
  static const _kSavedWeight = 'user_weight';
  static const _kSavedEmail = 'user_email';
  static const _kSavedPassword = 'user_password';
  static const _kSavedAvatar = 'user_avatar'; // Если нужно хранить аватар

  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Создаём (регистрируем) пользователя.
  /// Если email уже зарегистрирован, вернёт false.
  static Future<bool> createUser({
    required String firstName,
    required String lastName,
    required String age,
    required String weight,
    required String email,
    required String password,
    String avatarPath = '',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final hashedPassword = _hashPassword(password);

    // Проверяем, не занято ли это мейлом
    final existingEmail = prefs.getString(_kSavedEmail);
    if (existingEmail == email) {
      // Пользователь с таким email уже зарегистрирован
      return false;
    }

    // Сохраняем данные
    await prefs.setString(_kSavedFirstName, firstName);
    await prefs.setString(_kSavedLastName, lastName);
    await prefs.setString(_kSavedAge, age);
    await prefs.setString(_kSavedWeight, weight);
    await prefs.setString(_kSavedEmail, email);
    await prefs.setString(_kSavedPassword, hashedPassword);

    if (avatarPath.isNotEmpty) {
      await prefs.setString(_kSavedAvatar, avatarPath);
    }

    // Считаем, что пользователь сразу залогинен
    await prefs.setBool(_kIsLoggedIn, true);
    return true;
  }

  /// Вход по email и паролю
  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final hashedPassword = _hashPassword(password);

    final savedEmail = prefs.getString(_kSavedEmail);
    final savedPassword = prefs.getString(_kSavedPassword);

    return savedEmail == email && savedPassword == hashedPassword;
  }

  /// Проверяем, залогинен ли пользователь
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kIsLoggedIn) ?? false;
  }

  /// Выход из аккаунта
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kIsLoggedIn, false);
  }

  /// Читаем профиль
  static Future<Map<String, String?>> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'firstName': prefs.getString(_kSavedFirstName) ?? 'User',
      'lastName': prefs.getString(_kSavedLastName) ?? 'Surname',
      'age': prefs.getString(_kSavedAge) ?? '0',
      'weight': prefs.getString(_kSavedWeight) ?? '0',
      'email': prefs.getString(_kSavedEmail) ?? 'user@example.com',
      'avatarPath':
          prefs.getString(_kSavedAvatar) ?? 'assets/images/avatar1.png',
    };
  }

  /// Обновить профиль (если нужно менять отдельно)
  static Future<void> updateUserProfile({
    String? firstName,
    String? lastName,
    String? age,
    String? weight,
    String? avatarPath,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (firstName != null) {
      await prefs.setString(_kSavedFirstName, firstName);
    }
    if (lastName != null) {
      await prefs.setString(_kSavedLastName, lastName);
    }
    if (age != null) {
      await prefs.setString(_kSavedAge, age);
    }
    if (weight != null) {
      await prefs.setString(_kSavedWeight, weight);
    }
    if (avatarPath != null) {
      await prefs.setString(_kSavedAvatar, avatarPath);
    }
    if (email != null) {
      await prefs.setString(_kSavedEmail, email);
    }
  }

  // Добавляем новые методы для работы с прогрессом тренировок
  static Future<void> markTrainingCompleted(
    String category,
    String trainingId,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'completed_${category.toLowerCase()}_trainings';
    final completedTrainings = prefs.getStringList(key) ?? [];

    if (!completedTrainings.contains(trainingId)) {
      completedTrainings.add(trainingId);
      await prefs.setStringList(key, completedTrainings);
      print(
        'Marked training $trainingId as completed in category $category',
      ); // Отладочный вывод
    }
  }

  static Future<List<String>> getCompletedTrainings(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'completed_${category.toLowerCase()}_trainings';
    return prefs.getStringList(key) ?? [];
  }

  static Future<double> getCategoryProgress(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'completed_${category.toLowerCase()}_trainings';
    final completedTrainings = prefs.getStringList(key) ?? [];

    // Определяем общее количество тренировок для категории
    const totalTrainings = {
      'Diagonal': 5,
      'Binder': 4,
      'Libero': 3,
      'Center Blocker': 4,
      'Doping Player': 4,
    };

    return totalTrainings[category] != null
        ? completedTrainings.length / totalTrainings[category]!
        : 0.0;
  }
}

class ProfileService {
  static const _kNameKey = 'profile_name';
  static const _kAgeKey = 'profile_age';
  static const _kWeightKey = 'profile_weight';
  static const _kAvatarPathKey = 'profile_avatar_path';

  // Сохранить данные профиля
  static Future<void> saveProfile({
    required String name,
    required String age,
    required String weight,
    required String avatarPath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kNameKey, name);
    await prefs.setString(_kAgeKey, age);
    await prefs.setString(_kWeightKey, weight);
    await prefs.setString(_kAvatarPathKey, avatarPath);
  }

  // Загрузить данные профиляa
  static Future<Map<String, String?>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_kNameKey),
      'age': prefs.getString(_kAgeKey),
      'weight': prefs.getString(_kWeightKey),
      'avatarPath': prefs.getString(_kAvatarPathKey),
    };
  }
}
