import 'dart:convert';


//from JSON to Model
Etudiant etudiantModelJson(String str) =>
    Etudiant.fromJson(json.decode(str));

//From Model to JSON
String etudiantModelToJson(Etudiant data) =>
    json.encode(data.toJson());

//Class definition
class Etudiant{
  int id;
  String nom;
  String prenom;
  String dateNais;
  Etudiant(this.id, this.nom, this.prenom, this.dateNais);

  // Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'nom': nom,
      'prenom': prenom,
      'datNais': dateNais,

    };
  }

  //JSON to Object
  factory Etudiant.fromJson(Map<String, dynamic> data) {
    return Etudiant(
      data['id'],
      data['nom'],
      data['prenom'],
      data['dateNais'],
    );
  }

  @override
  String toString() {
    return 'Etudiant{id: $id, nom: $nom, prenom: $prenom, dateNais: $dateNais}';
  }


}