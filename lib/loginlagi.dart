import 'dart:convert';
import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:wika/global.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/session.dart';

import 'toolmanual/alertmanual.dart';

class Loginlagi extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Loginlagi> {
  FirebaseMessaging messaging;

  Future<Function> x() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
      if (value != null) {
        Session().settoken(value);
      } else {
        print(value);
      }
    });
  }

  final username = TextEditingController();
  final password = TextEditingController();
  String _identifier = 'Unknown';
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new CircularProgressIndicator(),
                ),
                new Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var approvelevel = jsonDecode(applevel);
    print(approvelevel);
    password.text = "";
    print(username.text);
    initUniqueIdentifierState();
    initPlatformState();
    Session().sessionku().then((value) {
      final oks = json.decode(value);
      username.text = oks['user_id'];
      // print(oks['USERNAME']);
    });
    x();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }
    print(appBadgeSupported);
  }

  Future<void> initUniqueIdentifierState() async {
    String identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(children: <Widget>[
          Expanded(
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints.expand(height: 225),
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [lightBlueIsh, lightGreen],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0.2, 0.2),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                            child: new Image.asset('assets/images/logo.png',
                                height: 40)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 170),
                  constraints: BoxConstraints.expand(height: 370),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: username,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a username'),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a password'),
                            ),
                            SizedBox(height: 20),
                            ButtonTheme(
                              minWidth: double.infinity,
                              child: MaterialButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () {
                                  _onLoading();
                                  Internethttp()
                                      .login(username.text, password.text,
                                          _identifier)
                                      .then((value) {
                                    Navigator.pop(context);
                                    // print(value);
                                    if (value.body.length > 4) {
                                      print(_identifier);
                                      if (value.statusCode == 500) {
                                        showDialog(
                                            builder: (context) => Alertmanual()
                                                .a(context, value.body),
                                            context: context,
                                            barrierDismissible: false);
                                      } else {
                                        Session().getpassword().then((value) {
                                          if (value == password.text) {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/',
                                                    (Route<dynamic> route) =>
                                                        false);
                                          } else {
                                            showDialog(
                                                builder: (context) =>
                                                    Alertmanual().a(context,
                                                        "password salah"),
                                                context: context,
                                                barrierDismissible: false);
                                          }
                                        });
                                      }
                                    } else {
                                      showDialog(
                                          builder: (context) => Alertmanual().a(
                                              context,
                                              "Login Gagal Mohon Periksa username dan password anda"),
                                          context: context,
                                          barrierDismissible: false);
                                    }
                                    ;
                                  });
                                },
                                child: Text('Login'),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.notifications),
                                  Text("Pemberitahuan Aprrovel: 3")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ]),
          )
        ]),
      ),
    );
  }
}
