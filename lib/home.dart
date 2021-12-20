import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_mobile/luffy.dart';
import 'boutik.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double luffyX = -0.5;
  static double luffyY = 1;
  static bool holdingButton = false;
  double time = 0;
  double height = 0;
  double initialHeight = luffyY;
  String direction = "ok";
  bool midrun = false;
  bool userIsHoldingButton() {
    return holdingButton;
  }

  //réinitialise les variables qui font sauter le personnage
  void prejump() {
    setState(() {
      direction = "ok"; //image perso
      time = 0;
      initialHeight = luffyY;
    });
  }

  void jump() {
    prejump();
    Timer.periodic(const Duration(milliseconds: 40), (timer) {
      time += 0.05;
      //permet de faire un saut plus naturel
      height = -4.9 * time * time + 5 * time;

      if (initialHeight - height > 1) {
        setState(() {
          luffyY = 1;
          //annule le timer sinon saut de + en + vite
          timer.cancel();
        });
      } else {
        setState(() {
          luffyY = initialHeight - height;
        });
      }
    });
  }

  //move perso vers la droite
  void moveRight() {
    direction = "right"; //image perso
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      //permet de faire avancé le perso en maintenant le button
      //et de ne pas le faire dépassé du cadre de jeu
      if (userIsHoldingButton() == true && (luffyX + 0.08) < 1) {
        setState(() {
          luffyX += 0.08; //perso avance vers la droite
          midrun = !midrun; //hilusion que le perso marche
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (userIsHoldingButton() == true && (luffyX - 0.08) > -1) {
        setState(() {
          luffyX -= 0.08;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //container principal
        width: double.infinity, //taille container
        height: double.infinity, //taille container
        decoration: const BoxDecoration(
          image: DecorationImage(
              //fond de l'app
              image: AssetImage("assets/images/bgd.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            //colone qui va aider pour l'affichage
            //column va center auto les container suivant
            children: [
              Container(
                //container du titre du jeu
                //pour décoler le titre du top
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: 240, //taille container
                height: 70, //taille container
                decoration: BoxDecoration(
                  color: const Color(0xff000000), //color fond
                  //angle arrondi
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 5, //taille/épaiseur boxshadow
                      blurRadius: 7, //possition boxshadow
                      // changes position of shadow
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  //centre le text dans le container hauteur
                  child: Text(
                    "LAST END",
                    //permet d'avoir des polices spécial
                    style: GoogleFonts.pressStart2p(
                        //style text
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 22, //taille text
                        color: const Color(0xfff1f1f1)), //color text
                    //centre le text dans le container longueur
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                //container jeu
                padding: const EdgeInsets.all(8), //espace de 8 partout
                //décale de 40 le container du top
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                width: 340, //taille
                height: 300, //taille
                decoration: const BoxDecoration(
                  color: Color(0xff000000), //color fond
                ),
                child: Column(
                  children: [
                    Expanded(
                      //container ciel
                      //prend 4/5 place du container
                      flex: 4,
                      child: Container(
                        //container bleu
                        decoration: const BoxDecoration(
                          //affichage container
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), //arrondi les bords
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.blue, //color fond
                        ),
                        child: AnimatedContainer(
                          //widjet d'animation perso
                          alignment:
                              Alignment(luffyX, luffyY), //possition perso
                          duration: const Duration(milliseconds: 0),
                          child: MyLuffy(
                            //appelle class MyLuffy
                            direction: direction, //image direction clas myluffy
                            midrun: midrun, //image direction clas myluffy
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      //container terre
                      //prend 1/5 place du container
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                              //dégradé de color
                              begin:
                                  Alignment.topCenter, //dégradé de haut en bas
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff103c1a), //color verte
                                Color(0xff4c392d), //color marron
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //container des button pour faire bouger le perso
                width: 350,
                margin: const EdgeInsets.fromLTRB(0, 35, 0, 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      //button left
                      onTapDown: (details) {
                        //appuyer sur le button
                        holdingButton = true; //maintient button on
                        moveLeft(); //fonction pour faire bouge à gauche
                      },
                      onTapUp: (details) {
                        // relacher le button
                        holdingButton = false; //maintient button off
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color(0xfff1f1f1),
                                blurRadius: 5.0,
                                offset: Offset(0, 6),
                                spreadRadius: 0),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_back, //icon button
                          color: Color(0xfff1f1f1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: jump,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color(0xfff1f1f1),
                                blurRadius: 5.0,
                                offset: Offset(0, 6),
                                spreadRadius: 0),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Color(0xfff1f1f1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      //button droite
                      onTapDown: (details) {
                        holdingButton = true;
                        moveRight();
                      },
                      onTapUp: (details) {
                        holdingButton = false;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color(0xfff1f1f1),
                                blurRadius: 5.0,
                                offset: Offset(0, 6),
                                spreadRadius: 0),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xfff1f1f1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                //button redirection boutique
                child: SizedBox(
                  width: 160,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "BOUTIQUE",
                      style: GoogleFonts.medievalSharp(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff000000)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // ),
                onPressed: () {
                  //quand on appuie sur le button
                  Navigator.push(
                    context,
                    //redirige vers la page deux "boutique"
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
