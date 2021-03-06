import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_2/flutter_plugin_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  StreamSubscription _subscription;
  final List<String> _strings = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await PluginExample2().platformVersion;
      _subscription = PluginExample2().startListening((msg) {
        setState(() {
          _strings.add("${msg}");
        });
      });

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: TextField(
                      controller: _textEditingController,
                    ),
                  ),
                  Text('Running on: $_platformVersion\n'),
                  RaisedButton(
                    onPressed: () {
                      PluginExample2().showNative({'param1':'${_textEditingController.text}'});
                    },
                    child: Text('Open Native'),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Stream events from Native:'),
                  ),

                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: _strings.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.black12,
                          child: Text(" Event: ${_strings[index]}"),
                        );
                      },
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
