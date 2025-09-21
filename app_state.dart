import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

// ملاحظة: كل البيانات هنا تعليمية/محاكاة فقط
final _secure = const FlutterSecureStorage();
final _uuid = Uuid();

class AppState extends ChangeNotifier {
  bool loggedIn = false;

  List<Map<String, dynamic>> snippets = [];
  List<Map<String, dynamic>> notes = [];
  List<Map<String, dynamic>> ctfChallenges = [];

  List<String> virtualLocations = [
    'Neon Vault',
    'Glove Compartment',
    'Underseat Cache',
    'Roof Archive',
    'Engine Ledger'
  ];
  String activeLocation = 'Neon Vault';

  AppState() {
    load();
  }

  Future<void> load() async {
    try {
      final s = await _secure.read(key: 'cyberlab_snippets');
      if (s != null) snippets = List<Map<String, dynamic>>.from(jsonDecode(s));
      final n = await _secure.read(key: 'cyberlab_notes');
      if (n != null) notes = List<Map<String, dynamic>>.from(jsonDecode(n));
    } catch (e) {
      snippets = [];
      notes = [];
    }

    if (ctfChallenges.isEmpty) {
      ctfChallenges = [
        {
          'id': 'ctf1',
          'title': 'ما هو المنفذ الافتراضي للـ SSH؟',
          'options': ['22', '80', '443', '3389'],
          'answer': '22',
          'points': 10
        },
        {
          'id': 'ctf2',
          'title': 'ما هو بروتوكول نقل صفحات الويب؟',
          'options': ['FTP', 'HTTP', 'SMTP', 'DNS'],
          'answer': 'HTTP',
          'points': 8
        },
      ];
    }

    notifyListeners();
  }

  Future<void> saveAll() async {
    await _secure.write(key: 'cyberlab_snippets', value: jsonEncode(snippets));
    await _secure.write(key: 'cyberlab_notes', value: jsonEncode(notes));
  }

  void login() {
    loggedIn = true;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }

  Map<String, dynamic> generateSimulatedSnippet() {
    final id = _uuid.v4();
    final raw = 'SIM-${id.substring(0, 8)} - ${DateTime.now().toIso8601String()}';
    final encoded = base64Encode(utf8.encode(raw));
    final item = {
      'id': id,
      'title': 'Snippet ${snippets.length + 1}',
      'content': encoded,
      'createdAt': DateTime.now().toIso8601String(),
      'location': activeLocation
    };
    snippets.insert(0, item);
    saveAll();
    notifyListeners();
    return item;
  }

  void addNote(String title, String body) {
    notes.insert(
      0,
      {
        'id': _uuid.v4(),
        'title': title,
        'body': body,
        'createdAt': DateTime.now().toIso8601String()
      },
    );
    saveAll();
    notifyListeners();
  }

  void setLocation(String loc) {
    if (virtualLocations.contains(loc)) {
      activeLocation = loc;
      notifyListeners();
    }
  }

  void rotateLocation() {
    final i = virtualLocations.indexOf(activeLocation);
    activeLocation = virtualLocations[(i + 1) % virtualLocations.length];
    notifyListeners();
  }

  Future<void> clearDemo() async {
    snippets = [];
    notes = [];
    await _secure.delete(key: 'cyberlab_snippets');
    await _secure.delete(key: 'cyberlab_notes');
    notifyListeners();
  }
}