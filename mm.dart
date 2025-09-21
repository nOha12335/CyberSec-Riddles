// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//  @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const UserProfileScreen(),
//     );
//   }
// }
//
// class UserProfileScreen extends StatelessWidget {
//   const UserProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Profile"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // صورة المستخدم
//             Center(
//               child: Stack(
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.grey,
//                     child: Icon(Icons.person, size: 50, color: Colors.white),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.blue,
//                       radius: 18,
//                       child: const Icon(Icons.edit, color: Colors.white, size: 18),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 12),
//
//             // الاسم والإيميل
//             const Text(
//               "Noha Morwan",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               "nona@example.com",
//               style: TextStyle(color: Colors.grey),
//             ),
//
//             const SizedBox(height: 20),
//             const Divider(),
//
//             // المهارات
//             const Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "المهارات:",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: const [
//                 Chip(label: Text("Flutter")),
//                 Chip(label: Text("Dart")),
//                 Chip(label: Text("Firebase")),
//                 Chip(label: Text("Git")),
//                 Chip(label: Text("UI/UX")),
//                 Chip(label: Text("REST API")),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//             const Divider(),
//
//             // قائمة التعلم
//             Column(
//               children: const [
//                 ListTile(
//                   leading: Icon(Icons.check_circle, color: Colors.green),
//                   title: Text("فهم Stack Widget"),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.check_circle, color: Colors.green),
//                   title: Text("بناء واجهة باستخدام Row و Column"),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.check_circle, color: Colors.green),
//                   title: Text("التدريب على Wrap"),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.check_circle, color: Colors.green),
//                   title: Text("استخدام ListView.builder"),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
