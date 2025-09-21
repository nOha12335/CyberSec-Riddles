import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class RiddlePage extends StatefulWidget {
  final String level;
  const RiddlePage({super.key, required this.level});

  @override
  State<RiddlePage> createState() => _RiddlePageState(); 
}
//
// class _RiddlePageState extends State<RiddlePage> {
//   final controller = TextEditingController(); // ✅ للتحكم بالنص المكتوب في حقل الإجابة
//   String? result; // ✅ لتخزين نتيجة الإجابة (صحيح/خطأ)
//   int currentRiddle = 0; // ✅ مؤشر للغز الحالي
//
//   // ================== قائمة الألغاز ==================
//   final List<Map<String, String>> riddles = [
//     {"q": "ما هو أقوى جدار ضد الاختراق في الشبكات؟", "a": "firewall"},
//     {"q": "كلمة مرور قصيرة أم طويلة: أيهما أكثر أمانًا؟", "a": "طويلة"},
//     {"q": "ما هو التشفير الذي يستخدم مفتاح عام وخاص؟", "a": "rsa"},
//     {"q": "ما هو البروتوكول المسؤول عن تشفير حركة الإنترنت؟", "a": "https"},
//     {"q": "أي نوع من الهجمات يعتمد على إرسال رسائل مزيفة لإقناع المستخدم؟", "a": "phishing"},
//     {"q": "ما هو برنامج الكشف عن الفيروسات على الجهاز؟", "a": "antivirus"},
//     {"q": "ما اسم الهجوم الذي يعتمد على اختبار كلمات المرور بالقوة؟", "a": "brute force"},
//     {"q": "أي جهاز مسؤول عن توجيه البيانات بين الشبكات؟", "a": "router"},
//     {"q": "ما هي عملية التشفير التي تستخدم مفتاح واحد فقط؟", "a": "symmetric"},
//     {"q": "ما هو مصطلح البرمجيات الخبيثة؟", "a": "malware"},
//   ];
//
//   final storage = const FlutterSecureStorage(); // ✅ لتخزين الإجابات المشفرة بأمان على الجهاز
//
//   // دالة لتشفير الإجابة
//   String hashAnswer(String input) =>
//       sha256.convert(utf8.encode(input.trim().toLowerCase())).toString();
//   // ✅ تحويل الإجابة إلى أحرف صغيرة → تشفير SHA256 → تخزين مشفر
//
//   // دالة التحقق من الإجابة
//   void checkAnswer() async {
//     final input = controller.text.trim().toLowerCase(); // ✅ الحصول على النص المدخل من المستخدم
//     final hashedInput = hashAnswer(input); // ✅ تشفير الإجابة
//     await storage.write(key: 'riddle_$currentRiddle', value: hashedInput); // ✅ حفظ الإجابة المشفرة
//
//     if (input == riddles[currentRiddle]['a']) { // ✅ مقارنة الإجابة مع الإجابة الصحيحة
//       setState(() {
//         result = "صحيح ✅"; // ✅ تحديث النتيجة لتكون صحيحة
//         if (currentRiddle < riddles.length - 1) {
//           currentRiddle++; // ✅ الانتقال للغز التالي
//           controller.clear(); // ✅ مسح النص الموجود في حقل الإجابة
//         } else {
//           result = "🎉 أنهيت جميع الألغاز!"; // ✅ رسالة عند إنهاء كل الألغاز
//         }
//       });
//     } else {
//       setState(() => result = "خطأ ❌"); // ✅ إذا كانت الإجابة خاطئة
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("مستوى ${widget.level}")), // ✅ شريط التطبيق مع عرض المستوى
//       body: Padding(
//         padding: const EdgeInsets.all(20), // ✅ مسافة داخلية حول المحتوى
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               riddles[currentRiddle]["q"]!, // ✅ عرض نص السؤال الحالي
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20), // ✅ مسافة بين السؤال وحقل الإجابة
//             TextField(
//               controller: controller, // ✅ ربط حقل النص بالـ controller
//               decoration: const InputDecoration(
//                   labelText: "الإجابة", border: OutlineInputBorder()), // ✅ تصميم الحقل
//             ),
//             const SizedBox(height: 20), // ✅ مسافة بين حقل الإجابة وزر التحقق
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: checkAnswer, // ✅ عند الضغط، التحقق من الإجابة
//                 style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
//                 child: const Text("تحقق"), // ✅ نص الزر
//               ),
//             ),
//             if (result != null) ...[
//               const SizedBox(height: 20), // ✅ مسافة قبل عرض النتيجة
//               Text(result!, style: const TextStyle(fontSize: 20)), // ✅ عرض النتيجة (صحيح/خطأ أو انتهاء الألغاز)
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }