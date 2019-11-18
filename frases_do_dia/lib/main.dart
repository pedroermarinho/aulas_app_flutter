import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <String> _frases=["Mauris malesuada dapibus semper","Praesent eget aliquet orci, id tincidunt diam","Nullam pharetra suscipit lobortis"];
  var _fraseGerada = "Clique abaixo para gerar um nova frase";

  void _frasesGeradas(){
    int _cont=Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada=_frases[_cont];
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor:Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Image.asset("images/logo.png"),
                Text(
                  "${_fraseGerada}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              RaisedButton(onPressed: _frasesGeradas,
                color: Colors.green,
                child: Text(
                  "Nova Frase",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
