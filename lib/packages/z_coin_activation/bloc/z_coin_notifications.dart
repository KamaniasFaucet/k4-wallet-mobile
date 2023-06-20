import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:komodo_dex/utils/log.dart';

class ZCoinProgressNotifications {
  ZCoinProgressNotifications._();

  static final _instance = ZCoinProgressNotifications._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  bool _isSetupSuccessful = false;

  bool get canNotify => _isSetupSuccessful;

  static Future<void> initNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    bool userAccepted = false;

    final initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final initializationSettingsIOS = DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    final result = await flutterLocalNotificationsPlugin
        .initialize(initializationSettings);

    // Request permissions
    if (Platform.isIOS) {
      userAccepted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    if (Platform.isAndroid) {
      userAccepted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          .requestPermission();
    }

    _instance._isSetupSuccessful = result;

    if (!result) {
      if (!userAccepted) {
        Log(
          'ZCoinProgressNotifications: initNotifications',
          'User did not accept notifications.',
        );
      }

      Log(
        'ZCoinProgressNotifications: initNotifications',
        'Failed to initialize notifications.',
      );
    }
  }

  String _lastTicker = '';
  double _lastProgress = 0;

  static bool _shouldShowNotification(String ticker, double progress) {
    if (ticker != _instance._lastTicker) {
      _instance._lastTicker = ticker;
      _instance._lastProgress = progress;
      return true;
    }

    if ((progress - _instance._lastProgress).abs() > 0.05) {
      _instance._lastProgress = progress;
      return true;
    }

    return false;
  }

  static Future<void> showNotification({
    @required String ticker,
    @required double progress,
    Duration eta,
  }) async {
    if (!_instance._isSetupSuccessful) {
      Log(
        'ZCoinProgressNotifications: showNotification',
        'Notification setup not successful.',
      );
      return;
    }

    if (!_shouldShowNotification(ticker, progress)) {
      return;
    }

    final progressInt = (progress * 100).toInt();
    final etaString =
        eta != null && eta.inMinutes > 0 ? '${eta.inMinutes} minutes left' : '';

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'zhtlc_activation_status',
      'ZHTLC Activation Status',
      channelDescription: 'Shows the status of ZCoin activation',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
      showProgress: true,
      maxProgress: 100,
      onlyAlertOnce: true,
      autoCancel: false,
      progress: progressInt,
    );

    final iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
      threadIdentifier: androidPlatformChannelSpecifics.channelId,
    );
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    return flutterLocalNotificationsPlugin.show(
      0,
      'ZHTLC Activation in Progress ($progressInt%)',
      'Activating $ticker. Please do not close the app. $etaString',
      platformChannelSpecifics,
    );
  }

  static Future<void> clear() async {
    if (!_instance._isSetupSuccessful) {
      Log(
        'ZCoinProgressNotifications: cancelNotification',
        'Notification setup not successful.',
      );
      return;
    }

    return flutterLocalNotificationsPlugin.cancel(0);
  }
}
