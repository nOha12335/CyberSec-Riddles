import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeManager extends ChangeNotifier {
  final _secure = const FlutterSecureStorage();

  late Color primaryColor;
  bool darkroom = false;

  ThemeManager() {
    primaryColor = Colors.teal;
  }

  ThemeData get themeData => ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkroom ? Colors.black : Colors.grey[900],
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  );

  Future<void> load() async {
    try {
      final col = await _secure.read(key: 'theme_primary');
      final dr = await _secure.read(key: 'theme_darkroom');
      if (col != null) {
        primaryColor = Color(int.parse(col));
      }
      if (dr != null) darkroom = dr == '1';
    } catch (e) {}
    notifyListeners();
  }

  void updatePrimaryColor(Color c) {
    primaryColor = c;
    _secure.write(key: 'theme_primary', value: c.toRadixString(16));
    notifyListeners();
  }

  void toggleDarkroom(bool v) {
    darkroom = v;
    _secure.write(key: 'theme_darkroom', value: v ? '1' : '0');
    notifyListeners();
  }
}

extension on Color {
  toRadixString(int i) {}
}