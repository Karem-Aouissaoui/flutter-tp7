import 'package:flutter/material.dart';
import 'package:tp7/screen/drawer.dart';

class DashboardThree extends StatefulWidget {
  const DashboardThree({Key? key}) : super(key: key);

  @override
  _DashboardThreeState createState() => _DashboardThreeState();
}

class _DashboardThreeState extends State<DashboardThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My School'),
      ),
      drawer: NavDrawer(),
    );
  }
}
