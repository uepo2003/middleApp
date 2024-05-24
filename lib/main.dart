import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/state/themes_state.dart';
import 'package:middleapp/firebase_options.dart';
import 'package:middleapp/presentation/pages/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Middle App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode.theme,
      home: const Login(title: 'Middle App'),
    );
  }
}
