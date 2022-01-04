import 'package:flutter/material.dart';
import 'package:tp7/screen/gestion_classes.dart';
import 'package:tp7/screen/gestion_etudiants.dart';
import 'package:tp7/screen/gestion_formation.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Gestion des Classes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GestionClasse(),
              ));
            },
          ),
          ListTile(
            title: const Text('Gestion des étudiants'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GestionEtudiant(),
              ));
            },
          ),
          ListTile(
            title: const Text('Gestion des Formations'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GestionFormation(),
              ));
            },
          ),
        ],
      ),
    );
  }
}