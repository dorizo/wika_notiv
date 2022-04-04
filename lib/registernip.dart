import 'package:flutter/material.dart';
import 'package:wika/toolmanual/alertmanual.dart';

import 'global.dart';

class Registernip extends StatefulWidget {
  const Registernip({Key key}) : super(key: key);

  @override
  _RegisternipState createState() => _RegisternipState();
}

class _RegisternipState extends State<Registernip> {
  String _identifier = 'Unknown';
  String tokens = 'tokennull';
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context).settings.arguments;
    final Map<String, dynamic> data = agrs;
    setState(() {
      _identifier = data['device'];
      tokens = data['token'];
      print(data);
    });

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
                                  hintText: 'Masukan NIP *'),
                            ),
                            SizedBox(height: 20),
                            ButtonTheme(
                                minWidth: double.infinity,
                                child: MaterialButton(
                                  onPressed: () {
                                    print(tokens);
                                    if (username.text == '') {
                                      showDialog(
                                          builder: (context) => Alertmanual()
                                              .a(context, "NIP WAJIB DI ISI"),
                                          context: context,
                                          barrierDismissible: false);
                                    } else {
                                      Navigator.pushNamed(
                                          context, "/FaceDetectorView",
                                          arguments: {
                                            "username": username.text,
                                            "device": _identifier,
                                            "token": tokens,
                                          });
                                    }
                                  },
                                  color: Colors.blue,
                                  child: Text("Next"),
                                )),
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
