import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgd.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: 240,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff000000),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "BOUTIQUE",
                    style: GoogleFonts.pressStart2p(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 22,
                        color: const Color(0xfff1f1f1)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                //alligne les deux affiches de perso
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //container premier perso
                    //design container
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xffc6b69f),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      //contenude l'affiche
                      children: [
                        Container(
                          //titre affiche
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 6),
                          height: 30,
                          child: Center(
                            child: Text(
                              "WANTED",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 30,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        CarouselSlider(
                          //slider d'image des perso
                          options: CarouselOptions(
                              //image slider centrer
                              enlargeCenterPage: true,
                              //activer le scroll infini
                              enableInfiniteScroll: false,
                              //slide automatique
                              autoPlay: true),
                          items: [
                            //image à dérouler
                            Image.asset("assets/images/zoro1.png"),
                            Image.asset("assets/images/zoro2.png"),
                            Image.asset("assets/images/zoro3.png"),
                          ],
                        ), //la suite n'est que du text dans des containers
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          height: 30,
                          child: Center(
                            child: Text(
                              "DEAD OR ALIVE",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 14,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 30,
                          child: Center(
                            child: Text(
                              "Zoro",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 25,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          height: 30,
                          child: Center(
                            child: Text(
                              "\$ 320.000.000 -",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 16,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 110,
                              child: Center(
                                child: Text(
                                  "Fortune , Gloire et pouvoir, cet homme avait ammassé toutes les richesses du monde. Son nom Gold Roger, roi des pirates. Ses dernières paroles insitèrent les hommes de toute la planéte à s'aventurer en mer ! <<Mon trésor ? Je vous le laisse si vous voulez TROUVER LE ! je l'ai laissé quelque part dans ce monde.>> Tous se lancèrent que la route de Grand Line dans l'espoir de mettre la main sue ce fameux  trésor le monde entier connut alors une grande vague de piraterie !",
                                  style: GoogleFonts.rye(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 5,
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              child: Center(
                                child: Text(
                                  "MARINE",
                                  style: GoogleFonts.rye(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xffc6b69f),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 6),
                          height: 30,
                          child: Center(
                            child: Text(
                              "WANTED",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 30,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true),
                          items: [
                            Image.asset("assets/images/nami1.png"),
                            Image.asset("assets/images/nami2.png"),
                            Image.asset("assets/images/nami3.png"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          height: 30,
                          child: Center(
                            child: Text(
                              "DEAD OR ALIVE",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 14,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 30,
                          child: Center(
                            child: Text(
                              "NAMI",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 25,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          height: 30,
                          child: Center(
                            child: Text(
                              "\$ 66.000.000 -",
                              style: GoogleFonts.rye(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 16,
                                  color: const Color(0xff000000)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 110,
                              child: Center(
                                child: Text(
                                  "Fortune , Gloire et pouvoir, cet homme avait ammassé toutes les richesses du monde. Son nom Gold Roger, roi des pirates. Ses dernières paroles insitèrent les hommes de toute la planéte à s'aventurer en mer ! <<Mon trésor ? Je vous le laisse si vous voulez TROUVER LE ! je l'ai laissé quelque part dans ce monde.>> Tous se lancèrent que la route de Grand Line dans l'espoir de mettre la main sue ce fameux  trésor le monde entier connut alors une grande vague de piraterie !",
                                  style: GoogleFonts.rye(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 5,
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              child: Center(
                                child: Text(
                                  "MARINE",
                                  style: GoogleFonts.rye(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: const Color(0xff000000),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Recruter",
                          style: GoogleFonts.pressStart2p(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 14,
                              color: const Color(0xfff1f1f1)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // ),
                    onPressed: () {},
                  ),
                  MaterialButton(
                    color: const Color(0xff000000),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Recruter",
                          style: GoogleFonts.pressStart2p(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 14,
                              color: const Color(0xfff1f1f1)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // ),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                height: 163,
              ),
              MaterialButton(
                child: SizedBox(
                  width: 160,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Go Game !",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
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
