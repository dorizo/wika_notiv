import 'package:flutter/material.dart';

class Alertmanual{
  AlertDialog a(BuildContext context , String Message){
    return AlertDialog(
      title: Text('Pemberitahuan'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(Message),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('keluar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class Alertmanual extends StatefulWidget {
//   Alertmanual({Key key}) : super(key: key);
//
//   @override
//   _PersonDetailsDialogState createState() {
//     return _PersonDetailsDialogState();
//   }
// }
//
// class _PersonDetailsDialogState extends State<Alertmanual> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Login Gagal'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Text('You will never be satisfied.'),
//             Text('You\’re like me. I’m never satisfied.'),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//           child: Text('keluar'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }