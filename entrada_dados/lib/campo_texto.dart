import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();
  var valor="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Texto"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(35),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              controller: _textEditingController,
            ),
          ),
          RaisedButton(onPressed: (){
            setState(() {
              valor = _textEditingController.text;
            });
          },
            child: Text("Mostar"),
            color: Colors.green,
          ),
          Text(valor)
        ],
      ),
    );
  }
}
