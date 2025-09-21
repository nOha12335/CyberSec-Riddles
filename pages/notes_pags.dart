
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _title = TextEditingController();
  final _body = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Knowledge Notebook (Encrypted)')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  TextField(controller: _title, decoration: const InputDecoration(hintText: 'Title')),
                  const SizedBox(height: 8),
                  TextField(controller: _body, maxLines: 4, decoration: const InputDecoration(hintText: 'Body')),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_title.text.trim().isEmpty && _body.text.trim().isEmpty) return;
                          app.addNote(_title.text.trim(), _body.text.trim());
                          _title.clear();
                          _body.clear();
                        },
                        child: const Text('Save Note'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Export (demo)'),
                              content: SelectableText(app.notes.toString()),
                              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                            ),
                          );
                        },
                        child: const Text('Export (demo)'),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: app.notes.length,
                  itemBuilder: (ctx, i) {
                    final n = app.notes[i];
                    return ListTile(
                      title: Text(n['title'] ?? ''),
                      subtitle: Text(n['createdAt']?.split('T').first ?? ''),
                      onTap: () => showDialog(
                        context: ctx,
                        builder: (_) => AlertDialog(
                          title: Text(n['title'] ?? ''),
                          content: SelectableText(n['body'] ?? ''),
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