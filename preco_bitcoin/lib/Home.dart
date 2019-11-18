import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _precoBitcoin = "Preço";

 void _atualizarPrecos() async{
    String url ="https://blockchain.info/ticker";
    http.Response response;
    response =  await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body) ;
    var moeda = data["BRL"];
    double _preco = moeda["15m"];
    String _symbol = moeda["symbol"];

    setState(() {
      _precoBitcoin="$_symbol: $_preco";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding(
                padding: EdgeInsets.all(30),
              child: Text(
                _precoBitcoin,
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ),
            RaisedButton(
              color: Colors.orange,
                onPressed: _atualizarPrecos,
              child: Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15,right: 30,left:30),
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 20
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
