class Classe{
  int codClass;
  String nomClass;
  int nbreEtud;

  Classe(this.codClass,this.nomClass, this.nbreEtud);

  Map<String, dynamic> toJson() {
    return {
      'codClass': codClass,
      'nomClass': nomClass,
      'nbreEtud': nbreEtud,
    };
  }

  //JSON to Object
  factory Classe.fromJson(Map<String, dynamic> data) {
    return Classe(
      data['codClass'],
      data['nomClass'],
      data['nbreEtud']
    );
  }

  Map<String, dynamic> map() {
    return {
      'codClass' : codClass,
      'nomClass' : nomClass,
      'nbreEtud' : nbreEtud
    };
  }

  @override
  String toString() {
    return 'Classe{codClass: $codClass, nomClass: $nomClass, nbreEtud: $nbreEtud}';
  }
}