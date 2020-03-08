import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
  );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async{

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados,"banco.db");

    var bd = await openDatabase(
      localBancoDados,
       version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      }
      );
    return bd;
  }
  _salva() async{
    Database db = await _recuperarBancoDados();
    Map<String, dynamic > dadosUsuario={
      "nome":"Jamilton",
      "idade": 18
    };
    int id = await db.insert("usuarios", dadosUsuario);
    print("salvo:$id");
  }

  _listarUsuarios()async{

    Database db = await _recuperarBancoDados();

    String sql="SELECT * FROM usuarios";
    List ususarios = await db.query(sql);

  }

  @override
  Widget build(BuildContext context) {
    _salva();
    return Container(
      
    );
  }
}