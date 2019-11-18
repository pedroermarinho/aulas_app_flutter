import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCEP = TextEditingController();
  String _resultado= "Resultado";

  _recuperarCep() async{
    String cep = _controllerCEP.text;
    String url = "http://viacep.com.br/ws/$cep/json";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    setState(() {
      _resultado="logradouro:$logradouro, complemento:$complemento bairro:$bairro localidade:$localidade";
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Consumo Serviço"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controllerCEP,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite um cep: ex: 05428200"
                ),
                style: TextStyle(
                  fontSize: 23
                ),
              ),
              RaisedButton(
                  child: Text("Clique aqui"),
                onPressed: _recuperarCep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
