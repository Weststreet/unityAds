import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:unityads/unityads.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<StreamSubscription<dynamic>> _streamSubscriptions =
  <StreamSubscription<dynamic>>[];
  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(Unityads.unityAdEvents.listen((String result) {
      print('获得$result金币啊aa');
    }));

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            FlatButton(onPressed: (){
              Unityads.initialize('3241911','3241911', false);
            },child: Text('初始化'),),
            FlatButton(onPressed: (){
              Unityads.showVideo();
            },child: Text('显示视频'),),

          ],),

        ),
      ),
    );
  }
}
