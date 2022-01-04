import 'dart:convert';
import 'package:tp7/models/classe.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/models/etudiant.dart';


// methode getClasses qui va recuperer tous
// les classes (n'oublions pas de créer un controlleur de Classe)
Future<List<Classe>> getClasses() async {
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/classes/all'));
  var jsonData = json.decode(data.body);

  List<Classe> classes = [];
  for (var c in jsonData) {
    // Classe classe = Classe(
    //   c['codClass'],
    //   c['nomClass'],
    //   c['nbreEtud'],
    // );
    Classe classe = Classe.fromJson(c);
    classes.add(classe);
    //print(classe.toString());
  }
  //print('length classes = ${classes.length}');
  return classes;
}

Future deleteById(int id) async{
  print ('id = $id');
  var data = await http.delete(Uri.parse('http://10.0.2.2:8080/classes/${id}'));
  print (data.body);
}

Future test() async{
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/classes/all'));
  print (data.body);
}

Future<List<Etudiant>> getEtudiantsbyClasse(int id) async {
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/etudiants/classe/$id'));
  var jsonData = json.decode(data.body);

  List<Etudiant> etudiants = [];
  for (var e in jsonData) {
    Etudiant etudiant = Etudiant(
        e['id'],
        e['nom'],
        e['prenom'],
        e['dateNais']
    );
    etudiants.add(etudiant);
    //print(classe.toString());
  }
  //print('length classes = ${classes.length}');
  return etudiants;
}

Future<List<Etudiant>> getEtudiants() async {
  var data = await http.get(Uri.parse('http://10.0.2.2:8080/etudiants/all'));
  var jsonData = json.decode(data.body);

  List<Etudiant> etudiants = [];
  for (var e in jsonData) {
    // Etudiant classe = Etudiant(
    //     e['id'],
    //     e['nom'],
    //     e['prenom'],
    //     e['dateNais']
    // );
    Etudiant etudiant = Etudiant.fromJson(e);
    etudiants.add(etudiant);
    //print(classe.toString());
  }
  //print('length classes = ${classes.length}');
  return etudiants;
}
