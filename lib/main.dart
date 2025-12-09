import 'package:flutter/material.dart';
import 'package:lab_13/config/app_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
        backgroundColor: AppConfig.isProduction ? Colors.blue : Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Environment: ${AppConfig.environment.name.toUpperCase()}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'API URL: ${AppConfig.apiBaseUrl}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Text(
              'Mode: ${AppConfig.isProduction ? 'Production' : 'Development'}',
              style: TextStyle(
                fontSize: 16,
                color: AppConfig.isProduction ? Colors.green : Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
