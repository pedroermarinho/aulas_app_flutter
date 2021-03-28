import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rede/app/modules/home/presenter/components/setor/setor.dart';
import 'package:rede/app/modules/home/presenter/pages/home/home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    controller.gerarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: controller.pesquisa,
            ),
            SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (_) => GridView.builder(
                  itemCount: controller.listWidget.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    return controller.listWidget.elementAt(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: controller.gerarDados,
        child: Icon(Icons.cached),
      ),
    );
  }
}
