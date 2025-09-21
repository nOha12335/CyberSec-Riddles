import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool canBiometric = false;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    final c = await auth.canCheckBiometrics;
    setState(() {
      canBiometric = c;
    });
  }

  Future<void> _auth() async {
    try {
      final ok = await auth.authenticate(
        localizedReason: 'ادخل للكابينة',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (ok && mounted) {
        Provider.of<AppState>(context, listen: false).login();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardPage()));
      }
    } catch (e) {
      // خطأ البصمة يتم تجاهله عرضياً
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text('Lambo CyberCab', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              if (canBiometric)
                ElevatedButton(onPressed: _auth, child: const Text('دخول ببصمة / وجه')),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppState>(context, listen: false).login();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardPage()));
                },
                child: const Text('دخول تجريبي'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}