 import 'package:flutter/material.dart';
// import 'riddle_page.dart'; // ✅ أضفت صفحة RiddlePage لعرض الألغاز
//
// class LevelPage extends StatelessWidget {
//   const LevelPage({super.key}); // ✅ إنشاء صفحة اختيار المستوى كمكون StatelessWidget
//
//   @override
//   Widget build(BuildContext context) {
//     final levels = ["مبتدئ", "متوسط", "متقدم"]; // ✅ قائمة مستويات اللعبة
//     final colors = [Colors.teal, Colors.orange, Colors.deepPurple]; // ✅ ألوان كل مستوى
//     final icons = [Icons.school, Icons.settings, Icons.star]; // ✅ أيقونات كل مستوى
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("اختر المستوى"), // ✅ عنوان شريط التطبيق
//         backgroundColor: Colors.teal, // ✅ لون شريط التطبيق
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16), // ✅ مسافة داخلية حول محتوى الصفحة
//         child: Column(
//           children: List.generate(levels.length, (index) { // ✅ إنشاء بطاقة لكل مستوى
//             return GestureDetector(
//               onTap: () { // ✅ عند الضغط على بطاقة المستوى
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => RiddlePage(level: levels[index]), // ✅ الانتقال لصفحة الألغاز وتمرير المستوى المختار
//                   ),
//                 );
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 12), // ✅ مسافة عمودية بين البطاقات
//                 padding: const EdgeInsets.all(20), // ✅ حشو داخلي للبطاقة
//                 decoration: BoxDecoration(
//                   color: colors[index], // ✅ لون البطاقة حسب المستوى
//                   borderRadius: BorderRadius.circular(20), // ✅ حواف دائرية
//                   boxShadow: const [ // ✅ إضافة ظل للبطاقة
//                     BoxShadow(
//                         color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(icons[index], color: Colors.white, size: 36), // ✅ أيقونة المستوى
//                     const SizedBox(width: 20), // ✅ مسافة بين الأيقونة والنص
//                     Text(
//                       levels[index], // ✅ اسم المستوى
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold), // ✅ تنسيق النص
//                     ),
//                     const Spacer(), // ✅ تعبئة المساحة الفارغة بين النص والسهم
//                     const Icon(Icons.arrow_forward_ios, color: Colors.white), // ✅ سهم للانتقال
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }