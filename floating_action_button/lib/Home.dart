import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: Text("Conteudo"),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add  ),
        onPressed: (){
          
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){

                }
            )
          ],
        ),
      ),
    );
  }
}