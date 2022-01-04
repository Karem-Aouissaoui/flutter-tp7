import 'package:flutter/material.dart';
import 'package:tp7/screen/classe_dialog.dart';
import 'package:tp7/screen/drawer.dart';

import '../dao.dart';

class GestionClasse extends StatefulWidget {
  const GestionClasse({Key? key}) : super(key: key);

  @override
  _GestionClasseState createState() => _GestionClasseState();
}

class _GestionClasseState extends State<GestionClasse> {
  ClasseDialog classeDialog = ClasseDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des classes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 600.0,
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
                      return Dismissible(
                        key: Key(snapshot.data[index].codClass.toString()),
                        onDismissed: (direction) {
                          //deleteById(int.parse(snapshot.data[index].codClass.toString()));
                          // setState(() {
                          // //students!.removeAt(index);
                          // });
                        },
                        child: ListTile(
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

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ListEtudiant(
                            //         classe: Classe(
                            //             snapshot.data[index].codClass,
                            //             snapshot.data[index].nomClass,
                            //             snapshot.data[index].nbreEtud
                            //         )
                            //     ),
                            //   ),
                            // );
                          },//onTap()
                        ),
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
