enum BuildEnvironment { dev, staging, prod }

class AppConfig {
  static const String _envKey = 'BUILD_ENV';
  static const String _apiUrlKey = 'API_URL';
  static BuildEnvironment get environment {
    const envString = String.fromEnvironment(_envKey, defaultValue: 'dev');
    return BuildEnvironment.values.firstWhere(
      (e) => e.name == envString,
      orElse: () => BuildEnvironment.dev,
    );
  }

  static String get apiBaseUrl {
    return const String.fromEnvironment(
      _apiUrlKey,
      defaultValue: 'https://api-dev.example.com',
    );
  }

  static bool get isProduction => environment == BuildEnvironment.prod;
  static bool get isDevelopment => environment == BuildEnvironment.dev;
  static String get appName {
    switch (environment) {
      case BuildEnvironment.dev:
        return 'MyApp Dev';
      case BuildEnvironment.staging:
        return 'MyApp Staging';
      case BuildEnvironment.prod:
        return 'MyApp';
    }
  }
}
