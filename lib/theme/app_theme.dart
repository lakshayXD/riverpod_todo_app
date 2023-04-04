import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData _baseTheme(
      Brightness brightness, {
        Color? textColor,
        Color? accentColor,
        Color? onAccentColor,
        Color? scaffoldBackgroundColor,
      }) {
    late final ColorScheme defaultColorScheme;

    switch (brightness) {
      case Brightness.light:
        defaultColorScheme = const ColorScheme.light();
        textColor ??= Colors.black;
        break;
      case Brightness.dark:
        defaultColorScheme = const ColorScheme.dark();
        textColor ??= Colors.white;
        break;
    }

    final iconThemeData = IconThemeData(color: accentColor);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      iconTheme: iconThemeData,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        iconTheme: iconThemeData.copyWith(color: textColor),
        actionsIconTheme: iconThemeData,
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      colorScheme: defaultColorScheme.copyWith(
        brightness: brightness,
        primary: accentColor,
        onPrimary: onAccentColor ?? textColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          onPrimary: textColor,
          padding: const EdgeInsets.all(10),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      splashFactory: InkSparkle.splashFactory,
      bottomSheetTheme: BottomSheetThemeData(
        modalElevation: 10,
        backgroundColor: scaffoldBackgroundColor,
        modalBackgroundColor: scaffoldBackgroundColor,
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
          TargetPlatform.values,
          value: (_) => const CupertinoPageTransitionsBuilder(),
        ),
      ), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return accentColor; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return accentColor; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return accentColor; }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return accentColor; }
 return null;
 }),
 ),
    );
  }

  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: const Color(0xFF3A96FF),
    onAccentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFF000000),
  ).copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF111111),
      selectedItemColor: Color(0xFF3A96FF),
      unselectedItemColor: Color(0xFF707070),
      selectedLabelStyle: TextStyle(
        fontSize: 11,
        color: Color(0xFF3A96FF),
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11,
        color: Color(0xFF707070),
      ),
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: DividerThemeData(
      color: const Color(0xFFFFFFFF).withOpacity(0.6),
      space: 1,
      thickness: 0.25,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      displayMedium: const TextStyle(
        fontSize: 18,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: const Color(0xFFFFFFFF).withOpacity(0.8),
        fontWeight: FontWeight.w500,
      ),
      labelLarge: const TextStyle(
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF181818),
      prefixIconColor: const Color(0xFFFFFFFF).withOpacity(0.3),
      errorStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(10),
      hintStyle: TextStyle(
        color: const Color(0xFFFFFFFF).withOpacity(0.3),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          width: 0.5,
          color: Color(0xFF2C2C2C),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          width: 0.75,
          color: Color(0xFF2C2C2C),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          width: 0.5,
          color: Color(0xFF863636),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0xFF863636),
        ),
      ),
    ),
  );
}