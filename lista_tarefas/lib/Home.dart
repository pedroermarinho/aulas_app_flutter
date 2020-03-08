import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listTarefa = [];
  Map<String, dynamic> _ultimaTarefaRemovido= Map();
  TextEditingController _controllerTarefa = TextEditingController();

   Future<File> _getFile() async{
    Directory diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json"); 
  }

  _salvarTarefa(){
    String textoDigitado = _controllerTarefa.text;
    Map<String, dynamic> tarefa= Map();
    tarefa["titulo"]= textoDigitado;
    tarefa["realizar"]=false;
    setState(() {
      _listTarefa.add(tarefa);
    });
    _salvarAquivo();
    _controllerTarefa.text ="";
  }

  _salvarAquivo() async{

    var arquivo = await _getFile(); 

    String dados = json.encode(_listTarefa);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async{
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget criarItemLista(context,index){

    // final item = _listTarefa[index]['titulo']+index.toString();

    return  Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()), 
      direction: DismissDirection.endToStart,
      onDismissed: (direction){

        _ultimaTarefaRemovido = _listTarefa[index];

        _listTarefa.removeAt(index);
        _salvarAquivo();

        final snackbar = SnackBar(
          duration: Duration(seconds: 5),
          content: Text("Tarefa removida!!"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: (){
              setState(() {
                _listTarefa.insert(index, _ultimaTarefaRemovido);
              });
              _salvarAquivo();
            }
            ),
        );

        Scaffold.of(context).showSnackBar(snackbar);

      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
      title:Text(_listTarefa[index]['titulo']) ,
      value: _listTarefa[index]['realizar'], 
      onChanged: (valorAlterado){
        setState(() {
          _listTarefa[index]['realizar']=valorAlterado;
        });
        _salvarAquivo();
      }
      )
      );
  }


  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados){
      setState(() {
        _listTarefa = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _salvarAquivo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefa"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listTarefa.length,
              itemBuilder: criarItemLista
              )
            )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(
                      labelText: "Digite sua tarefa"
                    ),
                    onChanged: (Text){

                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: ()=> Navigator.pop(context),
                    ),
                    FlatButton(
                      child: Text("Salvar"),
                      onPressed: (){
                        _salvarTarefa();
                        
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
            );
          }
      ),
    );
  }
}
