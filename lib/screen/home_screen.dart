import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/components/my_container.dart';
import 'dart:math';

import 'package:my_app/data/data.dart';
import 'package:random_color/random_color.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

RandomColor _randomColor=RandomColor();
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String versebutton='';
  int currentindex;
  Color _color=_randomColor.randomColor();
  final _screenShotControler=ScreenshotController();

  void gerarversiculo(){
    currentindex=Random().nextInt(versiculos.length);
    _color=_randomColor.randomColor(
    colorBrightness: ColorBrightness.dark,
    colorSaturation: ColorSaturation.lowSaturation);
    setState(() {
      versebutton=versiculos[currentindex];
    });
  }


  @override
  void initState() { 
    super.initState();
    gerarversiculo();
  }

  void _takeScreenShot()async{
  final imageFile =await _screenShotControler.capture();
  Share.shareFiles([imageFile.path],
  text: 'compartilhado por Rafaela');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('caixinha de promessas'),
    centerTitle: true,
    backgroundColor: Color(0xff31313a),
    actions: [
      IconButton(onPressed: (){
        _takeScreenShot();
      }, icon: Icon(Icons.share))
    ],),
    backgroundColor: Color(0xff837c7b),
    body: Screenshot(controller: _screenShotControler,
          child: MyContaier(colour: _color,
      tittle: versebutton,
      ontap: (){
        gerarversiculo();
      },),
    ),
    
      
    );
  }
}