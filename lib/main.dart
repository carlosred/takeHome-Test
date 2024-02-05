import 'package:flutter/material.dart';
import 'package:takehometest/Utils/contants.dart';
import 'package:takehometest/presentation/screens/home_commits.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Contants.appTitle,
      theme: ThemeData(
        primaryColor: Contants.cardColor,
        cardColor: Contants.cardColor,
        useMaterial3: true,
      ),
      home: const HomeCommits(),
    );
  }
}
