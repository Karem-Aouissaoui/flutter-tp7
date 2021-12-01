import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tp7/models/etudiant.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/models/formation.dart';

class ListFormations extends StatefulWidget {
  var nomEtud;
  var idEtud;

  ListFormations({Key? key, this.idEtud, this.nomEtud}) : super(key: key);

  @override
  _ListFormationsState createState() => _ListFormationsState();
}

class _ListFormationsState extends State<ListFormations> {
  @override
  Widget build(BuildContext context) {
    //test();
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des formations"),
      ),
      body: Container(
        child: FutureBuilder(
            future: getFormations(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                );
              }
              print(snapshot.data!.length);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].nom),
                    subtitle: Text(
                        'Durée: ${snapshot.data[index].duree} heures'),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        Icon(Icons.edit), // icon-1
                        Icon(Icons.delete), // icon-2
                      ],
                    ),
                    onTap: () {

                    },
                  );
                },
              );
            }),
      ),
    );
  }

  Future<List<Formation>> getFormations() async {
    //on recupere le code de l'étudiant pour consomer l'api qui va afficher
    //les formations faites par cet étudiant.
    print("hello");
    var data = await http.get(
        Uri.parse('http://10.0.2.2:8080/formations/etudiant/${widget.idEtud}'));
    var jsonData = json.decode(data.body);
    print('iam here' + data.body);
    List<Formation> formations = [];
    try {
      /*for (var f in jsonData) {
        Formation form = Formation(
            f['id'],
            f['nom'],
            f['duree']
        );
        formations.add(form);
      }*/
      var form = Formation.fromJson(jsonData);
      formations.add(form);
      print (form);
    }catch(e){
      print(e);
    }
    return formations;
  }

  Future test() async{
    var data = await http.get(Uri.parse('http://10.0.2.2:8080/formations/etudiant/${widget.idEtud}'));
    print (data.body);
  }
}
