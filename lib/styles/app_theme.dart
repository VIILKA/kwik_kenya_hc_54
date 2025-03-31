import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// ---------------------------
  /// Цветовая палитра
  /// ---------------------------
  static const Color orange = Color.fromARGB(255, 235, 144, 36);
  static const Color green = Color.fromARGB(255, 52, 168, 83);
  static const Color whiteGrey = Color.fromRGBO(248, 248, 248, 1.0);
  static const Color greyText = Color.fromRGBO(142, 142, 147, 0.95);

  /// Дополнительные цвета
  static const Color blue = Color(0xff65AAEA);
  static const Color red = Color.fromARGB(255, 255, 59, 48);

  /// Цвета навигационной панели
  static const Color bottomNavSelected = Color(
    0xFFF6AA05,
  ); // оранжевый для активного
  static const Color bottomNavUnselected = Color(
    0x82828282,
  ); // серый для неактивного (70% прозрачности)
  static const Color bottomNavBackground = Color(0xFF102335); // темно-синий фон
  static const Color bottomNavBorder = Color(
    0xFFA1A1A1,
  ); // цвет верхней границы
  static const Color bottomNavShadow = Color(
    0x26C7C7C7,
  ); // цвет тени (15% прозрачности)

  /// Цвета для Home Page
  static const Color homeBackground = Color(0xFFFDF7E0); // бежевый фон
  static const Color homeText = Color(0xFF161A1A); // темно-серый текст
  static const Color homeImageOverlay = Color(
    0xE6171408,
  ); // оверлей для изображения
  static const Color homeImageGradientEnd = Color(
    0x00991F00,
  ); // конец градиента

  /// Цвета для Training Page
  static const Color trainingBackground = Color(0xFFFDF7E0);
  static const Color trainingText = Color(0xFF161A31);
  static const Color trainingChipActive = Color(0xFFF8AB05);
  static const Color trainingChipInactive = Color(0xFFCDD3F4);
  static const Color trainingChipDisabled = Color(0xFF747474);
  static const Color trainingOverlayGradientStart = Color(0x59F8AB05);
  static const Color trainingOverlayGradientEnd = Color(0x00991F00);

  /// Color palette
  static const Color primary = Color(0xFFDAA520); // Dark golden
  static const Color secondary = Color(0xFF2C3E50); // Dark blue-gray
  static const Color background = Color(0xFF1C1C1E); // Dark background
  static const Color surface = Color(0xFF2D2D30); // Surface color
  static const Color clay = Color(0xFF3D3D40); // Clay effect color

  /// Clay effect colors
  static const Color clayLight = Color(0xFF4A4A4D);
  static const Color clayShadow = Color(0xFF161618);

  /// Text colors
  static const Color textPrimary = Color(0xFFFAF0E6);
  static const Color textSecondary = Color(0xFFB8B8B8);

  /// Navigation colors
  static const Color navActive = Color(0xFFDAA520);
  static const Color navInactive = Color(0xFF808080);
  static const Color navBackground = Color(0xFF1C1C1E);

  /// Training colors
  static const Color trainingCardBg = Color(0xFF2D2D30);
  static const Color trainingChipActiveBg = Color(0xFFDAA520);
  static const Color trainingChipInactiveBg = Color(0xFF3D3D40);

  /// Brutalist Color Palette
  static const Color neonPink = Color(0xFFFF2E63);
  static const Color electricBlue = Color(0xFF00F5FF);
  static const Color brutalYellow = Color(0xFFFFE900);
  static const Color brutalBlack = Color(0xFF0D0D0D);
  static const Color brutalWhite = Color(0xFFF2F2F2);

  /// Background patterns
  static const List<Color> brutalGradient = [neonPink, electricBlue];

  /// Text styles with brutal approach
  static TextStyle brutalHeadline = GoogleFonts.pressStart2p(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: brutalWhite,
    letterSpacing: 2,
  );

  static TextStyle brutalBody = GoogleFonts.spaceMono(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: brutalWhite,
  );

  /// Brutal box decoration
  static BoxDecoration brutalBox = BoxDecoration(
    color: brutalBlack,
    border: Border.all(color: brutalYellow, width: 4),
    boxShadow: [
      BoxShadow(color: neonPink, offset: Offset(8, 8), blurRadius: 0),
    ],
  );

  /// ---------------------------
  /// Текстовые стили
  /// ---------------------------
  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    shadows: [Shadow(color: clayShadow, offset: Offset(2, 2), blurRadius: 4)],
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 21.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 17.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyTiny = TextStyle(
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
  );

  /// ---------------------------
  /// Тема приложения
  /// ---------------------------
  static ThemeData themeData = ThemeData(
    primaryColor: orange,
    scaffoldBackgroundColor: whiteGrey,

    /// Используем GoogleFonts.rubikTextTheme,
    /// а затем поверх «копируем» свои стили (если хотим сохранить размеры).
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      // Если нужно - добавьте и другие стили, например, titleLarge и т.д.
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: orange,
      primary: orange,
      secondary: green,
    ),
  );

  /// Clay Container Decoration
  static BoxDecoration clayBox = BoxDecoration(
    color: surface,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(color: clayLight, offset: Offset(-4, -4), blurRadius: 8),
      BoxShadow(color: clayShadow, offset: Offset(4, 4), blurRadius: 8),
    ],
  );
}
