// import 'package:flutter/material.dart';
// import 'package:tp7/models/etudiant.dart';
// import 'package:tp7/provider/list_provider.dart';
// import 'models/classe.dart';
// import 'dao.dart';
// import 'package:provider/provider.dart';
//
// class DashboardThree extends StatefulWidget {
//   const DashboardThree({Key? key}) : super(key: key);
//
//   @override
//   _DashboardThreeState createState() => _DashboardThreeState();
// }
//
// class _DashboardThreeState extends State<DashboardThree> {
//   List<Classe> classes = [];
//   List<Etudiant> etudiants = [];
//   Classe? _selectClasse;
//   var taskitems ;
//
//   initClasses() async{
//     final cs = await getClasses();
//     setState(() {
//       classes = cs;
//     });
//     setState(() {
//       taskitems.loadAll();
//       etudiants = taskitems.list;
//     });
//     print (classes.length);
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     initClasses();
//     taskitems = Provider.of<ListProvider>(context, listen: false);
//
//     print('etudiants = ${etudiants.length}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Liste des étudiants'),
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.topCenter,
//               margin: const EdgeInsets.only(bottom: 20, top: 10),
//               child: const Text(
//                 'Les Classes',
//                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
//               ),
//             ),
//             //================================================== liste des classes
//             (classes == [])? const Text('classes[] est vide'):
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
//                 color: Colors.white,
//                 child: DropdownButton<Classe>(
//                   hint: const Text('Choisir une classe'),
//                   value:_selectClasse ,
//                   isExpanded: true,
//                   items: classes.map<DropdownMenuItem<Classe>>((Classe value){
//                     return DropdownMenuItem<Classe>(
//                       value: value,
//                       child: Text(value.nomClass),
//                     );
//                   }).toList(),
//                   onChanged: (newValue){
//                     setState(() {
//                       _selectClasse = newValue!;
//                       taskitems.loadItems(newValue.codClass);
//                       etudiants = taskitems.list;
//                       print ('etudiants.length = ${etudiants.length}');
//                     });
//                   },
//
//                 )
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             //======================================================Liste des étudiants
//             LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints viewportConstraints) {
//                   return SingleChildScrollView(
//                     child: Container(
//                       color: Colors.white,
//                       height: 500.0,
//                       padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
//                       child: Consumer<ListProvider>(builder: (context, provider, listTile){
//                         return ListView.builder(
//                           itemCount: etudiants.length,
//                           itemBuilder: buildList,
//                         );
//                       }),
//                     ),
//                   );
//                 }
//             )
//           ]
//       ),
//     );
//   }
//   //========================================provider test===============/
//   Widget buildList(BuildContext context, int index){
//     return ListTile(
//       title: Text(etudiants[index].nom+' '+etudiants[index].prenom),
//       subtitle: Text('Date de naissance: '+etudiants[index].dateNais),
//       trailing: Wrap(
//         spacing: 12, // space between two icons
//         children: const <Widget>[
//           Icon(Icons.edit), // icon-1
//           Icon(Icons.delete), // icon-2
//         ],
//       ),
//       onTap: (){
//
//       },
//     );
//   }
// }
