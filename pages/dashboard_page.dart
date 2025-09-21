import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../widgets/neon_background.dart';
import 'code_lab_page.dart';
// import 'notes_page.dart';
import 'notes_pags.dart';
import 'settings_page.dart';
import 'ctf_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lambo CyberCab'),
        actions: [IconButton(onPressed: () => app.logout(), icon: const Icon(Icons.exit_to_app))],
      ),
      body: Stack(
        children: [
          const AnimatedNeonBackground(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: _LeftPanel()),
                Expanded(flex: 2, child: _CenterPanel()),
                Expanded(flex: 1, child: _RightPanel()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LeftPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text('Virtual Locations'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: app.virtualLocations
                    .map((l) => ChoiceChip(
                  label: Text(l),
                  selected: app.activeLocation == l,
                  onSelected: (_) => app.setLocation(l),
                ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              ElevatedButton(onPressed: () => app.rotateLocation(), child: const Text('Rotate'))
            ]),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              const ListTile(title: Text('Quick'), subtitle: Text('Actions')),
              ListTile(
                title: const Text('Code Lab'),
                trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CodeLabPage())), child: const Text('Open')),
              ),
              ListTile(
                title: const Text('Notes'),
                trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotesPage())), child: const Text('Open')),
              ),
              ListTile(
                title: const Text('CTF'),
                trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CtfPage())), child: const Text('Play')),
              ),
              ListTile(
                title: const Text('Settings'),
                trailing: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())), child: const Text('Open')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CenterPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Colors.black.withAlpha(int as int),
          child: Stack(
            children: [
              Positioned.fill(child: Center(child: Image.asset('assets/images/lambo_silhouette.png', fit: BoxFit.contain))),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                      Text('Active Location:', style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 4),
                    ]),
                    ElevatedButton(
                      onPressed: null,
                      child: const Text('Enter Code Lab'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 140,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.black.withRed(int as int),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(child: _MiniMeter(title: 'Integrity', value: 0.92)),
                SizedBox(width: 8),
                Expanded(child: _MiniMeter(title: 'Confidentiality', value: 0.87)),
                SizedBox(width: 8),
                Expanded(child: _MiniMeter(title: 'Availability', value: 0.95)),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class _RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Snippets', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: app.snippets.length,
            itemBuilder: (ctx, i) {
              final s = app.snippets[i];
              return Card(
                color: Colors.black.withBlue(int as int),
                child: ListTile(
                  title: Text(s['title'] ?? ''),
                  subtitle: Text('Saved at ${s['location'] ?? 'Unknown'} • ${s['createdAt']?.toString().split('T').first ?? ''}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      showDialog(
                        context: ctx,
                        builder: (_) => AlertDialog(
                          title: Text(s['title'] ?? ''),
                          content: SelectableText(s['content'] ?? ''),
                          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _MiniMeter extends StatelessWidget {
  final String title;
  final double value;
  const _MiniMeter({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final percent = (value * 100).toInt();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 12, color: Colors.white70)),
      const SizedBox(height: 8),
      LinearProgressIndicator(value: value, minHeight: 14),
      const SizedBox(height: 6),
      Text('$percent%', style: const TextStyle(fontSize: 12)),
    ]);
  }
}