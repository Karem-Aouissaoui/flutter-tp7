import 'dart:convert';
import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/models/etudiant.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:tp7/routes/list_etudiants.dart';

import 'models/classe.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var classe;
  @override
  Widget build(BuildContext context) {
    //test();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard | List des Classes'),
      ),
      body: Container(
        child: FutureBuilder(
            future: getClasses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                );
              }
              //print(snapshot.data!.length);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].nomClass),
                    subtitle: Text('${snapshot.data[index].nbreEtud} étudiants'),
                    leading: CircleAvatar(
                      child: Text(snapshot.data[index].codClass.toString()),
                    ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {

                        },
                      ),
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListEtudiant(
                              classe: Classe(
                                snapshot.data[index].codClass,
                                snapshot.data[index].nomClass,
                                snapshot.data[index].nbreEtud
                              )
                            ),
                          ),
                      );
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}


// methode getClasses qui va recuperer tous
// les classes (n'oublions pas de créer un controlleur de Classe)
Future<List<Classe>> getClasses() async {
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/classes/all'));
  var jsonData = json.decode(data.body);

  List<Classe> classes = [];
  for (var c in jsonData) {
    Classe classe = Classe(
      c['codClass'],
      c['nomClass'],
      c['nbreEtud'],
    );
    classes.add(classe);
    //print(classe.toString());
  }
  //print('length classes = ${classes.length}');
  return classes;
}


Future test() async{
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/classes/all'));
  print (data.body);
}