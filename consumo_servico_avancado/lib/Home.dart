import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase="https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async{
    List<Post> _postagens = List();
    http.Response response = await http.get(_urlBase+"/posts");
    var dataJson = json.decode(response.body);

    for ( var post in dataJson ){
      _postagens.add(Post(post["userId"],post["id"],post["title"],post["body"]));
    }
    return _postagens;
  }

  void _post() async{

    Post post = new Post(120,null,"Titulo","corpo da postagem");

    var corpo = json.encode(
        post.toJson()
    );

    http.Response response = await http.post(
      _urlBase+"/posts",
      body: corpo,
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      }
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }


  void _put() async{
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null,
          "title": "Titulo alterado",
          "body": "corpo da postagem alterado"
        }
    );

    http.Response response = await http.put(
        _urlBase+"/posts/1",
        body: corpo,
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }
  void _patch() async{
    var corpo = json.encode(
        {
          "userId": 120,
          "body": "corpo da postagem alterado"
        }
    );

    http.Response response = await http.patch(
        _urlBase+"/posts/1",
        body: corpo,
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }
  void _delete() async{

    http.Response response = await http.delete(
      _urlBase+"/posts/1",
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start ,
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                    onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                    onPressed: _patch,
                ),
                RaisedButton(
                  child: Text("Remover"),
                    onPressed: _delete,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if(snapshot.hasError){
                          return Container(
                            color: Colors.red,
                            child: Text(
                              "Erro ao carregar",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25
                              ),
                            ),
                          );
                        }else{
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context,index){

                                List<Post> lista = snapshot.data;
                                Post post = lista[index];


                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.body),
                                );
                              }
                          );
                        }
                        break;
                    }
                    return Text("");
                  }

              ),
            )
          ],
        ),
      ),
    );
  }
}
