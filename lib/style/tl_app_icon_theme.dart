import 'package:flutter/material.dart';

// Theme type enum that matches the Swift implementation
enum TLAppIconThemeType {
  sunOrange,
  limeGreen,
  marineBlue,
  cherryBlossom,
  pastryBloom,
  notebook;

  // Convert String to TLAppIconThemeType safely
  static TLAppIconThemeType fromString(String value) {
    try {
      return TLAppIconThemeType.values.firstWhere(
        (type) => type.name == value,
        orElse: () => TLAppIconThemeType.sunOrange,
      );
    } catch (e) {
      print(
          "Warning: $value does not match any TLAppIconThemeType case. Returning .sunOrange as default.");
      return TLAppIconThemeType.sunOrange;
    }
  }
}

// Using ValueNotifier to ensure UI updates when theme changes
final ValueNotifier<TLAppIconThemeType> themeNotifier =
    ValueNotifier<TLAppIconThemeType>(TLAppIconThemeType.sunOrange);

// Current selected theme - can be changed for hot reload
// This will update the ValueNotifier when changed
TLAppIconThemeType get selectedThemeType => themeNotifier.value;
set selectedThemeType(TLAppIconThemeType newType) {
  themeNotifier.value = newType;
}

class TLAppIconTheme {
  final String name;
  final Color appBackgroundColor;
  final Color hatColor;
  final Color boardColor;
  final Color checkmarkColor;

  TLAppIconTheme({
    required this.name,
    required this.appBackgroundColor,
    required this.hatColor,
    required this.boardColor,
    required this.checkmarkColor,
  });
}

// Map themes to their enum values
final Map<TLAppIconThemeType, TLAppIconTheme> themeMap = {
  TLAppIconThemeType.sunOrange: TLAppIconTheme(
    name: "sunOrange",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(255, 169, 56, 1),
    boardColor: const Color.fromRGBO(255, 252, 242, 1),
    checkmarkColor: const Color.fromRGBO(169, 210, 139, 1),
  ),
  TLAppIconThemeType.limeGreen: TLAppIconTheme(
    name: "limeGreen",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(73, 194, 70, 1), // Vibrant green
    boardColor: const Color.fromRGBO(255, 255, 230, 1), // Soft pale yellow
    checkmarkColor:
        const Color.fromRGBO(255, 204, 0, 1), // Golden yellow accent
  ),
  TLAppIconThemeType.marineBlue: TLAppIconTheme(
    name: "marineBlue",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(131, 169, 252, 1), // Soft blue
    boardColor: const Color.fromRGBO(236, 248, 255, 1), // Very light blue
    checkmarkColor:
        const Color.fromRGBO(101, 221, 155, 1), // Teal/turquoise accent
  ),
  TLAppIconThemeType.cherryBlossom: TLAppIconTheme(
    name: "cherryBlossom",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(255, 170, 180, 1), // Cherry blossom pink
    boardColor: const Color.fromRGBO(255, 245, 250, 1), // Barely pink
    checkmarkColor:
        const Color.fromRGBO(219, 112, 147, 1), // Deeper pink/raspberry accent
  ),
  TLAppIconThemeType.pastryBloom: TLAppIconTheme(
    name: "pastryBloom",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(255, 213, 158, 1), // Soft orange/peach
    boardColor: const Color.fromRGBO(252, 250, 242, 1), // Cream
    checkmarkColor:
        const Color.fromRGBO(165, 117, 98, 1), // Cinnamon brown accent
  ),
  TLAppIconThemeType.notebook: TLAppIconTheme(
    name: "notebook",
    appBackgroundColor: Colors.white,
    hatColor: const Color.fromRGBO(100, 100, 100, 1), // Medium gray
    boardColor: const Color.fromRGBO(253, 253, 253, 1), // Off-white
    checkmarkColor:
        const Color.fromRGBO(123, 162, 237, 1), // Bright blue accent
  ),
};

// Helper function to get the current theme
TLAppIconTheme getCurrentTheme() {
  return themeMap[selectedThemeType]!;
}

// Keep the list for backward compatibility if needed
final List<TLAppIconTheme> tlAppIconThemeList = [
  themeMap[TLAppIconThemeType.sunOrange]!,
  themeMap[TLAppIconThemeType.limeGreen]!,
  themeMap[TLAppIconThemeType.marineBlue]!,
  themeMap[TLAppIconThemeType.cherryBlossom]!,
  themeMap[TLAppIconThemeType.pastryBloom]!,
  themeMap[TLAppIconThemeType.notebook]!,
];
