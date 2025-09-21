// import 'package:flutter/material.dart';
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           leading: Container(
//             margin: EdgeInsets.all(8),
//
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: 0.3),
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//             ),
//             child: Icon(Icons.arrow_back_ios, color: Colors.white),
//           ),
//           title: Text(
//             "باقات الانترنت",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: ListView.separated(
//           itemCount: 9,
//           separatorBuilder: (context, index) => Divider(color: Colors.blue),
//           itemBuilder:
//               (context, index) => Container(
//                 width: double.infinity,
//                 height: 350,
//                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   textDirection: TextDirection.rtl,
//                   children: [
//                     Text(
//                       "عنوان الباقه",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Icon(Icons.ac_unit_outlined, color: Colors.grey),
//                         Text(
//                           "1.5جيجا",
//                           style: TextStyle(fontSize: 25, color: Colors.grey),
//                         ),
//                         Spacer(),
//                         Icon(Icons.ac_unit_outlined, color: Colors.grey),
//                         Text(
//                           "7صباحا",
//                           style: TextStyle(fontSize: 25, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Icon(Icons.ac_unit_outlined, color: Colors.grey),
//                         Text(
//                           "1.5جيجا صباحي",
//                           style: TextStyle(fontSize: 25, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Container(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: MaterialButton(
//                             color: Colors.red,
//
//                             onPressed: () {},
//                             child: Text(
//                               "اشتراك",
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         Text(
//                           "1000 r.y",
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//         ),
//       ),
//     );
//   }
// }
