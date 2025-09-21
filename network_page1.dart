import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  String status = "لم يتم الفحص بعد";


  Future<void> checkNetwork() async {
    final connectivityResult = await Connectivity().checkConnectivity();


    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        status = "✅ متصل: بيانات الهاتف";
      } else if (connectivityResult == ConnectivityResult.wifi) {
        status = "✅ متصل: WiFi";
      } else {
        status = "❌ لا يوجد اتصال بالإنترنت";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("فحص الشبكة")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
//             Text(status, style: const TextStyle(fontSize: 20)), // ✅ عرض حالة الشبكة
//             const SizedBox(height: 20), // ✅ مسافة بين النص وزر الفحص
//             ElevatedButton(
//               onPressed: checkNetwork, // ✅ عند الضغط يتم فحص الشبكة
//               child: const Text("افحص الآن"), // ✅ نص الزر
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }