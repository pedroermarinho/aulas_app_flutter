import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navegacao/main.dart';

class TelaSecundaria extends StatefulWidget {

  String nome;

//  TelaSecundaria(this.nome);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.all(15),
                child: Text("Ir para a Tela "),
                onPressed: (){
                  Navigator.pushNamed(context, "/");
                }
            )
          ],
        ),
      ),

    );
  }
}
