import 'package:flutter/material.dart';
import 'package:lab_13/config/app_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      home: Scaffold(
        appBar: AppBar(title: Text(AppConfig.appName)),
        body: const Center(child: Text('Production Environment')),
      ),
    );
  }
}
