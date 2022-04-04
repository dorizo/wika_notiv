import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:wika/internet/internethttp.dart';
import 'package:wika/session.dart';
import 'package:wika/toolmanual/alertmanual.dart';

import 'global.dart';

class Setpassword extends StatefulWidget {
  const Setpassword({Key key}) : super(key: key);

  @override
  _SetpasswordState createState() => _SetpasswordState();
}

class _SetpasswordState extends State<Setpassword> {
  final username = TextEditingController();
  final password = TextEditingController();
  String _identifier = 'Unknown';
  String tokens = 'tokennull';
  FirebaseMessaging messaging;
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
    username.text = "";
    password.text = "";
    initUniqueIdentifierState();
    initPlatformState();
    x();
  }

  initPlatformState() async {
    String appBadgeSupported;

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
    String user = ModalRoute.of(context).settings.arguments as String;
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
                  constraints: BoxConstraints.expand(height: 330),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a password'),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: username,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter a repassword'),
                            ),
                            SizedBox(height: 20),
                            ButtonTheme(
                              minWidth: double.infinity,
                              child: MaterialButton(
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () {
                                  Internethttp()
                                      .login(user, password.text, _identifier)
                                      .then((value) {
                                    // print(value);
                                    if (value.body.length > 4) {
                                      print(_identifier);
                                      if (value.statusCode == 500) {
                                        var tagsJson = jsonDecode(value.body);
                                        showDialog(
                                            builder: (context) => Alertmanual()
                                                .a(context, tagsJson['error']),
                                            context: context,
                                            barrierDismissible: false);
                                      } else {
                                        if (username.text == password.text) {
                                          Session().setuser(value.body);
                                          Session().setpassword(password.text);
                                          Session().sessionku().then((value) {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/',
                                                    (Route<dynamic> route) =>
                                                        false);
                                          });
                                        } else {
                                          showDialog(
                                              builder: (context) =>
                                                  Alertmanual().a(context,
                                                      "password tidak sama"),
                                              context: context,
                                              barrierDismissible: false);
                                        }
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
