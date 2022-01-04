import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tp7/models/classe.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/screen/gestion_classes.dart';

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
                keyboardType: TextInputType.number,
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
                  hintText: 'numbre of students'
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
                    body: json.encode(classe.toJson()));
                print(res.body);
                if (res.body != null) {
                  print('insertion avec succes');
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GestionClasse(),));
                }else{
                  print('erreur insertion');
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

