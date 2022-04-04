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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  String _identifier = 'Unknown';
  String tokens = 'tokennull';
  FirebaseMessaging messaging;
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

  Future<Function> x() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      if (value != null) {
        Session().settoken(value);
      } else {}
    });
    Session().gettoken().then((value) {
      if (value != null) {
        tokens = value;
      }
      print(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // username.text = "WB080052";
    // password.text = "WB080052";
    initUniqueIdentifierState();
    initPlatformState();
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
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(children: <Widget>[
            Stack(children: <Widget>[
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
                  constraints: BoxConstraints.expand(height: 400),
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
                                  hintText: 'Enter a NIP'),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Password'),
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
                                    // print(value);
                                    Navigator.pop(context);
                                    if (value.body.length > 4) {
                                      print(_identifier);
                                      if (value.statusCode == 500) {
                                        var tagsJson = jsonDecode(value.body);
                                        showDialog(
                                            builder: (context) => Alertmanual().a(
                                                context,
                                                "Login Gagal Mohon Di cek Kembali"),
                                            context: context,
                                            barrierDismissible: false);
                                      } else {
                                        Session().setuser(value.body);
                                        // Session().sessionku().then((value) {
                                        Session().setpassword(password.text);
                                        Session().sessionku().then((value) {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/',
                                                  (Route<dynamic> route) =>
                                                      false);
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
                            SizedBox(height: 20),
                            ButtonTheme(
                                minWidth: double.infinity,
                                child: MaterialButton(
                                  onPressed: () {
                                    FlutterAppBadger.updateBadgeCount(3);
                                    print(tokens);
                                    Navigator.pushNamed(context, "/Registernip",
                                        arguments: {
                                          "device": _identifier,
                                          "token": tokens,
                                        });
                                  },
                                  color: Colors.black45,
                                  child: Text("Register Request"),
                                )),
                            SizedBox(height: 20),
                            // ButtonTheme(
                            //     minWidth: double.infinity,
                            //     child: MaterialButton(
                            //       onPressed: () {
                            //         print(_identifier + '--' + tokens);
                            //       },
                            //       color: Colors.black45,
                            //       child: Text("Not Support image"),
                            //     ))
                          ],
                        ),
                      ),
                    ),
                  ))
            ]),
          ]),
        ),
      ),
    );
  }
}
