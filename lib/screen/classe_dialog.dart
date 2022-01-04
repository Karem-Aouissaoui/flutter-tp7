import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:tp7/models/classe.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class ClasseDialog {
  final txtCodClass = TextEditingController();
  final txtNomClass = TextEditingController();
  final txtNbreEtud = TextEditingController();
  Widget buildDialog(BuildContext context) {


    return AlertDialog(
        title: Text('Class list'),
        shape:
        RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(30.0)),
        content: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
                controller: txtCodClass,
                decoration: const InputDecoration(
                    hintText: 'Class Code')
            ),
            TextField(
                controller: txtNomClass,
                decoration: const InputDecoration(
                    hintText: 'Class Name')
            ),
            TextField(
              controller: txtNbreEtud,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Class List numbre of students'
              ),
            ),
            ElevatedButton(
              child: const Text('Save Class List'),
              onPressed: () async {
                Classe classe = Classe(
                    int.parse(txtCodClass.text),
                    txtNomClass.text,
                    int.parse(txtNbreEtud.text)
                );
                var url = 'http://10.0.2.2:8080/classes';
                var res = await http.post(Uri.parse(url),
                    headers: {'Content-Type': 'application/json'},
                    body: classe.toJson());
                print(res.body);
                if (res.body != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                }
              },
            ),
          ]),
        ));
  }

  // Future insertClass() async {
  //   var url = 'http://10.0.2.2:8080/classes';
  //   var res = await http.post(Uri.parse(url),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({'email': , 'password': }));
  //   print(res.body);
  //   if (res.body != null) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Dashboard(),
  //         ));
  //   }
  // }


}

