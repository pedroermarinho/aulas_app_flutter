import 'package:flutter/material.dart';
import 'package:youtube/Telas/Biblioteca.dart';
import 'package:youtube/Telas/EmAlta.dart';
import 'package:youtube/Telas/Inicio.dart';
import 'package:youtube/Telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0 ;
  @override
  Widget build(BuildContext context) {
    List <Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
          height: 22,
          width: 92,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){
                print("ação: videocam");
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("ação: pesquisa");
              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print("ação: conta");
              }
          ),
        ],
      ),
      body:Container(
        padding: EdgeInsets.all(16),
          child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
           _indiceAtual =indice;
          });
        },
          type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              title: Text("Inico"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot),

            ),
            BottomNavigationBarItem(
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions),

            ),
            BottomNavigationBarItem(
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder),

            ),
          ]
      ) ,
    );
  }
}
