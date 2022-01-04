import 'package:flutter/material.dart';
import 'package:tp7/screen/drawer.dart';

class GestionFormation extends StatefulWidget {
  const GestionFormation({Key? key}) : super(key: key);

  @override
  _GestionFormationState createState() => _GestionFormationState();
}

class _GestionFormationState extends State<GestionFormation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Gestion des formations'),
      ),
    );
  }
}
