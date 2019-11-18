import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagenApp= AssetImage("images/padrao.png");
  var _mensagem ="Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagenApp=AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagenApp=AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagenApp=AssetImage("images/tesoura.png");
        });
        break;
    }
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem="Você ganhou!!!";
      });
    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mensagem="Você perdeu!!!";
      });
    }else{
      setState(() {
        this._mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jokenpo"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image(
                  image: _imagenApp,
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset(
                        "images/pedra.png",
                        height: 90
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset(
                      "images/papel.png",
                      height: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 90,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
