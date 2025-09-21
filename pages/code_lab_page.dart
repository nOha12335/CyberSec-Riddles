import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class CodeLabPage extends StatelessWidget {
  const CodeLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Code Lab (Simulation)')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Generate Simulated Snippet'),
                subtitle: Text('Location: ${app.activeLocation}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    final it = app.generateSimulatedSnippet();
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Generated'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text(it['title']), const SizedBox(height: 8), SelectableText(it['content'])],
                        ),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                      ),
                    );
                  },
                  child: const Text('Generate'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: app.snippets.length,
                  itemBuilder: (ctx, i) {
                    final s = app.snippets[i];
                    return ListTile(
                      title: Text(s['title'] ?? ''),
                      subtitle: Text('${s['location']} • ${s['createdAt']?.split('T').first ?? ''}'),
                      onTap: () => showDialog(
                        context: ctx,
                        builder: (_) => AlertDialog(
                          title: Text(s['title'] ?? ''),
                          content: SelectableText(s['content'] ?? ''),
                          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}