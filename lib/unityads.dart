import 'dart:async';

import 'package:flutter/services.dart';

class Unityads {
  static const MethodChannel _channel =
  const MethodChannel('unityads');

  static const EventChannel _unityAdEventChannel =
  EventChannel('plugins.flutter.io/unityAds');
  static Stream<String> _unityAdEvents;

  /// A broadcast stream of events from the device gyroscope.
  static Stream<String> get unityAdEvents {
    if (_unityAdEvents == null) {
      _unityAdEvents = _unityAdEventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => event.toString());
    }
    return _unityAdEvents;
  }


  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> initialize(String androidGameId,String iosGameId, bool testModel) async {
    final Map<String, dynamic> params = {};
    params['androidGameId'] = androidGameId;
    params['iosGameId'] = iosGameId;
    params['testModel'] = testModel;
    print('testModel=$testModel');
    await _channel.invokeMethod('initialize', params);
    return '';
  }

  static Future<String> showVideo() async {
    await _channel.invokeMethod('showVideo');
    return '';
  }

  static Future<bool>isReady() async{
    return  await _channel.invokeMethod('isReady');
  }
}
