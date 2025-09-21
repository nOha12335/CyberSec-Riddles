import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          ListTile(
            title: const Text('Primary Color'),
            trailing: DropdownButton<Color>(
              value: themeManager.primaryColor,
              items: [
                Colors.teal,
                Colors.purple,
                Colors.red,
                Colors.blue,
                Colors.orange
              ]
                  .map((c) => DropdownMenuItem(value: c, child: Container(width: 24, height: 24, color: c)))
                  .toList(),
              onChanged: (c) {
                if (c != null) themeManager.updatePrimaryColor(c);
              },
            ),
          ),
          SwitchListTile(
            title: const Text('Darkroom Mode'),
            value: themeManager.darkroom,
            onChanged: themeManager.toggleDarkroom,
          ),
        ]),
      ),
    );
  }
}