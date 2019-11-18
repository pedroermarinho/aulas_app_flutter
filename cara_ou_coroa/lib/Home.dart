import 'package:cara_ou_coroa/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  void _jogar(){
    Navigator.push(
        context,
      MaterialPageRoute(
          builder: (context) => Result(Random().nextInt(2))
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(97, 189, 140, 1),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
           Padding(
             padding: EdgeInsets.only(top: 30),
             child: GestureDetector(
               
               onTap: _jogar,
               child: Image.asset("images/botao_jogar.png"),
             ) ,
           )
          ],
        ),
      ),
    );
  }
}
