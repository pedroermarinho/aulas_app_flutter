import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Radio Button"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String escolha){
                  setState(() {
                    _escolhaUsuario=escolha;
                  });
                }
            ),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String escolha){
                  setState(() {
                    _escolhaUsuario=escolha;
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}
