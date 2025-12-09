class Environment {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api-dev.example.com',
  );
  static const bool isProduction = bool.fromEnvironment('PRODUCTION');
}
