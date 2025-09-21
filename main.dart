import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:root_checker_plus/root_checker_plus.dart';
import 'dart:io';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔒
  await ScreenProtector.preventScreenshotOn();

  // فحص الروت والجلبريك
  bool isUnsafe = false;
  if (Platform.isAndroid) {
    isUnsafe = await RootCheckerPlus.isRootChecker() ?? false;
  } else if (Platform.isIOS) {
    isUnsafe = await RootCheckerPlus.isJailbreak() ?? false;
  }
//   // تشغيل التطبيق بناءً على نتيجة الفحص
//   if (isUnsafe) {
//     runApp(const BlockedApp()); // شاشة الحظر
//   } else {
//     runApp(const CyberApp()); // التطبيق العادي
//   }
// }
//
// class CyberApp extends StatelessWidget {
//   const CyberApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CyberSec Riddles',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class BlockedApp extends StatelessWidget {
//   const BlockedApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             "❌ هذا التطبيق لا يعمل على الأجهزة المعدلة (Root/Jailbreak)",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }