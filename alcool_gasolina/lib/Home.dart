import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// ignore: camel_case_types
class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite número maiores que 0 e utilizando (.) ";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
      setState(() {
        _textoResultado="Melhor abastecer com gasolina";
      });
      } else {
        setState(() {
          _textoResultado="Melhor abastecer com alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ácool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black),
                  )),
              TextField(
                keyboardType: TextInputType.number,
                controller: _controllerAlcool,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _controllerGasolina,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "${_textoResultado}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
