import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp7/models/classe.dart';
import 'package:tp7/models/etudiant.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/routes/list_formations.dart';

class ListEtudiant extends StatefulWidget {
  var classe;
  ListEtudiant({Key? key, this.classe}) : super(key: key);

  @override
  _ListEtudiantState createState() => _ListEtudiantState();
}

class _ListEtudiantState extends State<ListEtudiant> {
  var idEtud ;
  var nomEtud ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.classe.nomClass} | Liste d'étudiant"),
      ),
      body: Container(
        child: FutureBuilder(
            future: getEtudiants(),
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
                    title: Text(snapshot.data[index].nom +' '+ snapshot.data[index].prenom ),
                    subtitle: Text('Date de naissance: ${snapshot.data[index].dateNais}'),
                    leading: CircleAvatar(
                      child: Text(snapshot.data[index].id.toString()),
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        Icon(Icons.edit), // icon-1
                        Icon(Icons.delete), // icon-2
                      ],
                    ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListFormations(
                              idEtud: snapshot.data[index].id,
                              nomEtud: snapshot.data[index].nom +' '+ snapshot.data[index].prenom
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

  Future<List<Etudiant>> getEtudiants() async{
    //on recupere le code de classe pour consomer l'api qui va afficher
    //les étudiants de cette classe.
    var codClass = widget.classe.codClass;
    var data = await http.get(Uri.parse('http://10.0.2.2:8080/etudiants/classe/${codClass}'));
    var jsonData = json.decode(data.body);

    List<Etudiant> etudiants = [];
    for (var e in jsonData){
      Etudiant etudiant = Etudiant(
        e['id'],
        e['nom'],
        e['prenom'],
        e['dateNais'],
      );
      etudiants.add(etudiant);
      // print(etudiant.toString());
    }
    return etudiants;
  }
}
