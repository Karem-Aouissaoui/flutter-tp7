import 'package:flutter/material.dart';
import 'package:tp7/models/etudiant.dart';
import 'package:tp7/routes/list_etudiants.dart';
import 'package:tp7/screen/classe_dialog.dart';
import 'models/classe.dart';
import 'dao.dart';

class DashboardTwo extends StatefulWidget {
  const DashboardTwo({Key? key}) : super(key: key);

  @override
  _DashboardTwoState createState() => _DashboardTwoState();
}

class _DashboardTwoState extends State<DashboardTwo> {
  var classe;
  @override
  Widget build(BuildContext context) {
    //test();
    ClasseDialog? dialog ;

    @override
    void initState() {
      dialog = ClasseDialog();
      super.initState();
    }
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
                    child: Text("error"),
                  ),
                );
              }
              print('nbr classes = ${snapshot.data!.length}');
              Classe _selectedClasse = snapshot.data[0];

              return Center (

                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0,),
                      const Text("Choose Class", style: TextStyle(fontSize: 20.0),),
                      SizedBox(height: 12.0,),
                      SizedBox(
                        width: 200.0,
                        child: DropdownButton <Classe>(
                          isExpanded: true,
                          items: snapshot.data.map<DropdownMenuItem<Classe>>((Classe value) {
                            return DropdownMenuItem<Classe>(
                              value: value,
                              child: Text(value.nomClass),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {_selectedClasse = value!;});
                          },
                          value: _selectedClasse,
                        ),
                      ),
                      Container(
                        height: 350.0,
                        child: FutureBuilder(
                            future: getEtudiantsbyClasse(_selectedClasse.codClass),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.data == null) {
                                return Container(
                                  child: Center(
                                    child: Icon(Icons.error),
                                  ),
                                );
                              }
                              print('nbre etudiants = ${snapshot.data!.length}');
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

                      )
                    ],
                  ),
                ),
              );
            }//future builder

            ),
      ),
    );
  }
}

