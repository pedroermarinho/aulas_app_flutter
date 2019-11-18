import 'package:entrada_dados/EntradaCheckbox.dart';
import 'package:entrada_dados/EntradaRadioButton.dart';
import 'package:entrada_dados/EntradaSwitch.dart';
import 'package:entrada_dados/campo_texto.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
//      home: CampoTexto(),
//      home: EntradaChecbox(),
//      home: EntradaRadioButton(),
      home: EntradaSwitch(),
    )
  );
}