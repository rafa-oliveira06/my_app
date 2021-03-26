import 'package:flutter/material.dart';
class MyContaier extends StatelessWidget {
  final String tittle;
  final Color colour; 
  final VoidCallback ontap;

  const MyContaier({Key key, this.tittle, this.colour, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
          child: Container(
            height: MediaQuery.of(context).size.height*.5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all( 32),
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(tittle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.white),),
            )),
        
      ),
    );
  }
}