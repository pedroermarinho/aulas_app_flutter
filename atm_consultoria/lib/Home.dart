import 'package:atm_consultoria/TelaCliente.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServico.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirCliente(){
    Navigator.push(context, MaterialPageRoute(
      builder:(context) => TelaCliente(),
    ));
  }

  void _abrirContato(){
    Navigator.push(context, MaterialPageRoute(
      builder:(context) => TelaContato(),
    ));
  }

  void _abrirServico(){
    Navigator.push(context, MaterialPageRoute(
      builder:(context) => TelaServico(),
    ));
  }

  void _abrirEmpresa(){
    Navigator.push(context, MaterialPageRoute(
      builder:(context) => TelaEmpresa(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Image.asset("images/logo.png"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                  onTap:_abrirEmpresa,
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset("images/menu_servico.png"),
                  ),
                  onTap:_abrirServico,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset("images/menu_cliente.png"),
                  ),
                  onTap: _abrirCliente,
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset("images/menu_contato.png"),
                  ),
                  onTap:_abrirContato,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
