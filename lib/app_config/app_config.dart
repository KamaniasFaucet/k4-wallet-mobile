AppConfig appConfig = AppConfig();

class AppConfig {
  int get maxCoinsEnabledAndroid => 50;
  int get maxCoinEnabledIOS => 20;

  // number of decimal places for trade amount input fields
  int get tradeFormPrecision => 8;

  int get batteryLevelLow => 30; // show warnign on swap confirmation page
  int get batteryLevelCritical => 20; // swaps disabled

  String get appName => 'atomicDEX';
  String get appCompanyLong => 'Komodo Platform';
  String get appCompanyShort => 'Komodo';

  bool get isFeedEnabled => true;
  String get feedProviderSourceUrl => 'https://komodo.live/messages';
}
