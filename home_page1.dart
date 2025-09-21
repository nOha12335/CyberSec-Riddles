import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';
import 'level_page.dart';
import 'dart:io';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String networkStatus = "لم يتم الفحص بعد";
//
//   @override
//   void initState() {
//     super.initState();
//     // 🔒 منع تصوير الشاشة أو تسجيلها
//     ScreenProtector.preventScreenshotOn();
//   }
//
//   @override
//   void dispose() {
//     // ⬅️ إعادة السماح عند الخروج (اختياري)
//     ScreenProtector.preventScreenshotOff();
//     super.dispose();
//   }
//
//   // دالة للتحقق الفعلي من الإنترنت
//   Future<bool> hasInternet() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   // دالة لفحص الشبكة وعرض النتيجة
//   Future<void> checkNetwork() async {
//     bool connected = await hasInternet();
//     setState(() {
//       networkStatus =
//       connected ? "✅ متصل بالإنترنت" : "❌ لا يوجد اتصال بالإنترنت";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "🛡️ ألغاز الأمان",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const LevelPage()),
//               ),
//               style: ElevatedButton.styleFrom(minimumSize: const Size(200, 60)),
//               child: const Text("ابدأ"),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: checkNetwork,
//               style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
//               child: const Text("فحص الشبكة"),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               networkStatus,
//               style: const TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
