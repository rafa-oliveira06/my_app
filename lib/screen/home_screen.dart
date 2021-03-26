import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/components/my_container.dart';
import 'dart:math';

import 'package:my_app/data/data.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String versebutton='';
  int currentindex;
  void gerarversiculo(){
    currentindex=Random().nextInt(versiculos.length);
    setState(() {
      versebutton=versiculos[currentindex];
    });
  }
  @override
  void initState() { 
    super.initState();
    gerarversiculo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('caixinha de promessas'),
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.share))
    ],),
    body: MyContaier(colour: Colors.red,
    tittle: versebutton,
    ontap: (){
      gerarversiculo();
    },),
    
      
    );
  }
}