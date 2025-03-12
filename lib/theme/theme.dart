import 'package:flutter/material.dart';
import 'package:flutter_recorder/theme/color_palette.dart';

// 커스텀 색상을 위한 확장
extension CustomColorScheme on ColorScheme {
  Color get noteYellow => ColorPalette.noteYellow;
  Color get noteBlue => ColorPalette.noteBlue;
  Color get noteGreen => ColorPalette.noteGreen;
  Color get notePink => ColorPalette.notePink;
  Color get success => ColorPalette.success;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: ColorPalette.background,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.surface,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        shape: const Border(
          bottom: BorderSide(color: ColorPalette.divider, width: 0.5),
        ),
        shadowColor: Colors.black.withOpacity(0.05),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 8,
      ),

      // Material 3 TextTheme 설정
      textTheme: const TextTheme(
        // 본문 텍스트 스타일
        bodyLarge: TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          color: ColorPalette.textSecondary,
          fontSize: 12,
          height: 1.3,
        ),

        // 제목 텍스트 스타일
        titleLarge: TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: ColorPalette.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ColorScheme 설정
      colorScheme: ColorScheme.light(
        // 기본 색상
        primary: ColorPalette.primary,
        secondary: ColorPalette.secondary,
        error: ColorPalette.error,
        background: ColorPalette.background,
        surface: ColorPalette.surface,
        surfaceVariant: ColorPalette.background.withOpacity(0.95),

        // 텍스트/아이콘 색상
        onPrimary: ColorPalette.textWhite,
        onSecondary: ColorPalette.textWhite,
        onBackground: ColorPalette.textPrimary,
        onSurface: ColorPalette.textPrimary,
        onSurfaceVariant: ColorPalette.textSecondary,
        onError: ColorPalette.textWhite,

        // 구분선 및 기타
        outline: ColorPalette.divider,
        outlineVariant: ColorPalette.divider.withOpacity(0.5),
      ),
    );
  }
}
