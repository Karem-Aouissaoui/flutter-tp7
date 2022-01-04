import 'package:flutter/material.dart';
import 'package:tp7/screen/classe_dialog.dart';
import 'package:tp7/screen/drawer.dart';

import '../dao.dart';

class GestionEtudiant extends StatefulWidget {
  const GestionEtudiant({Key? key}) : super(key: key);

  @override
  _GestionEtudiantState createState() => _GestionEtudiantState();
}

class _GestionEtudiantState extends State<GestionEtudiant> {
  ClasseDialog classeDialog = ClasseDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des étudiants'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 600.0,
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
                            children: const <Widget>[
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => classeDialog.buildDialog(context),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
