import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:material_ui/material_ui.dart';

import 'firebase_options.dart';

// TEMPORARY smoke-test screen. Replaced by the real Klima UI in Phase 1.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klima',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B3020)),
      ),
      home: const FirebaseSmokeTest(),
    );
  }
}

class _Check {
  _Check(this.label, this.ok, this.detail);
  final String label;
  final bool ok;
  final String detail;
}

class FirebaseSmokeTest extends StatefulWidget {
  const FirebaseSmokeTest({super.key});

  @override
  State<FirebaseSmokeTest> createState() => _FirebaseSmokeTestState();
}

class _FirebaseSmokeTestState extends State<FirebaseSmokeTest> {
  final List<_Check> _checks = [];
  bool _running = false;

  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    setState(() {
      _running = true;
      _checks.clear();
    });

    final results = <_Check>[];

    // 1. Core: app is initialised against the right project.
    final opts = Firebase.app().options;
    results.add(_Check('Firebase core', true, 'project: ${opts.projectId}'));

    // 2. Auth: reachable; nobody is signed in yet.
    try {
      final user = FirebaseAuth.instance.currentUser;
      results.add(_Check('Authentication', true,
          user == null ? 'siap, belum ada user login' : 'login: ${user.uid}'));
    } catch (e) {
      results.add(_Check('Authentication', false, '$e'));
    }

    // 3. Firestore: rules are locked, so permission-denied PROVES we reached
    //    the server and the rules are enforced.
    try {
      await FirebaseFirestore.instance.collection('events').limit(1).get();
      results.add(_Check('Firestore', false,
          'terbaca - rules seharusnya terkunci (cek rules!)'));
    } on FirebaseException catch (e) {
      final locked = e.code == 'permission-denied';
      results.add(_Check('Firestore', locked,
          locked ? 'terhubung, rules terkunci (permission-denied)' : e.code));
    } catch (e) {
      results.add(_Check('Firestore', false, '$e'));
    }

    // 4. Remote Config: fetch works even with no template published.
    try {
      final rc = FirebaseRemoteConfig.instance;
      await rc.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 15),
        minimumFetchInterval: Duration.zero,
      ));
      await rc.fetchAndActivate();
      results.add(_Check('Remote Config', true,
          'fetch berhasil (status: ${rc.lastFetchStatus.name})'));
    } catch (e) {
      results.add(_Check('Remote Config', false, '$e'));
    }

    if (!mounted) return;
    setState(() {
      _checks.addAll(results);
      _running = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Klima · Firebase test')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_running) const LinearProgressIndicator(),
          for (final c in _checks)
            Card(
              child: ListTile(
                leading: Icon(
                  c.ok ? Icons.check_circle : Icons.error,
                  color: c.ok ? Colors.green : Colors.red,
                ),
                title: Text(c.label),
                subtitle: Text(c.detail),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _running ? null : _run,
        tooltip: 'Ulangi tes',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
