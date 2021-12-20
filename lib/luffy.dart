import 'dart:math';

import 'package:flutter/material.dart';

//pas de changement dynamique
class MyLuffy extends StatelessWidget {
  final direction; //déclaration variable
  final midrun; //déclaration variable

  //affectation des variables à la class Luffy
  MyLuffy({this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    //condition if pour modifier l'imag du perso selon son orientation
    if (direction == "right") {
      return Container(
          width: 70,
          height: 70,
          child: midrun //enchaine les deux image à la suite
              //illusion de marcher
              ? Image.asset('assets/images/luffy2.png')
              : Image.asset('assets/images/luffy1.png'));
    }
    if (direction == "left") {
      return Container(
          width: 70,
          height: 70,
          child: midrun
              ? Image.asset('assets/images/luffy4.png')
              : Image.asset('assets/images/luffy5.png'));
    } else {
      //possition/image de base perso
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 70,
          height: 70,
          child: Image.asset('assets/images/luffy5.png'),
        ),
      );
    }
  }
}
