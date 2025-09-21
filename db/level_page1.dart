 import 'package:flutter/material.dart';
import 'riddle_page.dart'; // ✅

class LevelPage extends StatelessWidget {
  const LevelPage({super.key}); // ✅

  @override
  Widget build(BuildContext context) {
    final levels = ["مبتدئ", "متوسط", "متقدم"];
    final colors = [Colors.teal, Colors.orange, Colors.deepPurple];
    final icons = [Icons.school, Icons.settings, Icons.star];

    return Scaffold(
      appBar: AppBar(
        title: const Text("اختر المستوى"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(levels.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiddlePage(level: levels[index]),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(20), 
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