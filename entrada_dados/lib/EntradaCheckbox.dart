import 'package:flutter/material.dart';

class EntradaChecbox extends StatefulWidget {
  @override
  _EntradaChecboxState createState() => _EntradaChecboxState();
}

class _EntradaChecboxState extends State<EntradaChecbox> {
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Entrada de Texto"),
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text("Comida brasileria"),
                subtitle: Text("A melhor comida do mundo"),
//                activeColor: Colors.red,
                value: this._comidaBrasileira,
                onChanged: (bool valor){
                  setState(() {
                    this._comidaBrasileira=valor;
                  });
                }
            ),
            CheckboxListTile(
              title: Text("Comida mexicana"),
                subtitle: Text("A melhor comida do mundo"),
//                activeColor: Colors.red,
                value: this._comidaMexicana,
                onChanged: (bool valor){
                  setState(() {
                    this._comidaMexicana=valor;
                  });
                }
            ),
            RaisedButton(
              child: Text(
                  "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
                onPressed: (){

                }
            ),
            Text(
                "Valor comida brasileira $_comidaBrasileira",
              style: TextStyle(
                fontSize: 16
              ),
            ),
            Text(
                "Valor comida mexicana $_comidaMexicana",
              style: TextStyle(
                fontSize: 16
              ),
            )
//            Text("Comida brasileria"),
//            Checkbox(value: this._valor, onChanged: (bool valor){
//              setState(() {
//                this._valor=valor;
//              });
//            })
          ],
        ),
      ) ,
    );
  }
}
