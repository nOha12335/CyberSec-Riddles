import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class CtfPage extends StatefulWidget {
  const CtfPage({super.key});
  @override
  State<CtfPage> createState() => _CtfPageState();
}

class _CtfPageState extends State<CtfPage> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('CTF Challenges')),
      body: ListView.builder(
        itemCount: app.ctfChallenges.length,
        itemBuilder: (ctx, i) {
          final c = app.ctfChallenges[i];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...List.generate(c['options'].length, (j) {
                  final opt = c['options'][j];
                  return ListTile(
                    title: Text(opt),
                    leading: Radio<String?>(
                      value: opt,
                      groupValue: _selected,
                      onChanged: (v) {
                        setState(() {
                          _selected = v;
                        });
                        final ok = v == c['answer'];
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(ok ? 'Correct ✅' : 'Wrong ❌'),
                            content: Text(ok ? 'You earned ${c['points']} points' : 'Try again'),
                            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ]),
            ),
          );
        },
      ),
    );
  }
}
