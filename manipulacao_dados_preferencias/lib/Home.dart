import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _texto="Nada Salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async{
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("Valor $valorDigitado salvo");

  }
  _recuperar() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _texto= prefs.getString("nome") ?? "Sem Valor";  
    });
    
  }
  _remover() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulando Dados"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller: _controllerCampo,
               decoration: InputDecoration(
                 labelText: "Digite algo"
               ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 16
                    ),
                    ),
                  onPressed: () => _salvar(),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
                RaisedButton(
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                      fontSize: 16
                    )
                    ),
                  onPressed: () => _recuperar(),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
                RaisedButton(
                  child: Text(
                    "Remover",
                    style: TextStyle(
                      fontSize: 16
                    )
                    ),
                  onPressed: () => _remover(),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}