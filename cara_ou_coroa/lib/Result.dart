import 'package:cara_ou_coroa/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int result;

  Result(this.result);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

   // ignore: non_constant_identifier_names
   static var img_cara = AssetImage("images/moeda_cara.png");
   static var img_coroa = AssetImage("images/moeda_coroa.png");
  List <AssetImage> img = [img_cara,img_coroa];

  void _voltar(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(97, 189, 140, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: img[widget.result],
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: GestureDetector(
                onTap: _voltar,
                child: Image.asset("images/botao_voltar.png"),
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
