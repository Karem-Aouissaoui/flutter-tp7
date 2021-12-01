class Formation{
  int id;
  String nom;
  int duree;
  Formation(this.id, this.nom, this.duree);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'duree': duree,
    };
  }

  //JSON to Object
  factory Formation.fromJson(Map<String, dynamic> data) {
    return Formation(
        data['id'],
        data['nom'],
        data['duree']
    );
  }

  @override
  String toString() {
    return 'Formation{id: $id, nom: $nom, duree: $duree}';
  }
}