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

class _RiddlePageState extends State<RiddlePage> {
  final controller = TextEditingController();
  String? result;
  int currentRiddle = 0;

  // ================== قائمة الألغاز ==================
  final List<Map<String, String>> riddles = [
    {"q": "ما هو أقوى جدار ضد الاختراق في الشبكات؟", "a": "firewall"},
    {"q": "كلمة مرور قصيرة أم طويلة: أيهما أكثر أمانًا؟", "a": "طويلة"},
    {"q": "ما هو التشفير الذي يستخدم مفتاح عام وخاص؟", "a": "rsa"},
    {"q": "ما هو البروتوكول المسؤول عن تشفير حركة الإنترنت؟", "a": "https"},
    {"q": "أي نوع من الهجمات يعتمد على إرسال رسائل مزيفة لإقناع المستخدم؟", "a": "phishing"},
    {"q": "ما هو برنامج الكشف عن الفيروسات على الجهاز؟", "a": "antivirus"},
    {"q": "ما اسم الهجوم الذي يعتمد على اختبار كلمات المرور بالقوة؟", "a": "brute force"},
    {"q": "أي جهاز مسؤول عن توجيه البيانات بين الشبكات؟", "a": "router"},
    {"q": "ما هي عملية التشفير التي تستخدم مفتاح واحد فقط؟", "a": "symmetric"},
    {"q": "ما هو مصطلح البرمجيات الخبيثة؟", "a": "malware"},

  ];

  final storage = const FlutterSecureStorage();

  // دالة لتشفير الإجابة
  String hashAnswer(String input) =>
      sha256.convert(utf8.encode(input.trim().toLowerCase())).toString();

  void checkAnswer() async {
    final input = controller.text.trim().toLowerCase();
    final hashedInput = hashAnswer(input);
    await storage.write(key: 'riddle_$currentRiddle', value: hashedInput);

    if (input == riddles[currentRiddle]['a']) {
      setState(() {
        result = "صحيح ✅";
        if (currentRiddle < riddles.length - 1) {
          currentRiddle++;
          controller.clear();
        } else {
          result = "🎉 أنهيت جميع الألغاز!";
        }
      });
    } else {
      setState(() => result = "خطأ ❌");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مستوى ${widget.level}")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              riddles[currentRiddle]["q"]!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "الإجابة", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkAnswer,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
                child: const Text("تحقق"),
              ),
            ),
            if (result != null) ...[
              const SizedBox(height: 20),
              Text(result!, style: const TextStyle(fontSize: 20)),
            ]
          ],
        ),
      ),
    );
  }
}