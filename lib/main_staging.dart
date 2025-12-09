import 'package:flutter/material.dart';
import 'config/app_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      home: Scaffold(
        appBar: AppBar(title: Text(AppConfig.appName)),
        body: Center(child: Text('Staging Environment')),
      ),
    );
  }
}
