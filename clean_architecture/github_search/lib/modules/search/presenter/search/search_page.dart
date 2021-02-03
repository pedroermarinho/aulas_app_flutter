import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/modules/search/presenter/search/search_bloc.dart';
import 'package:github_search/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8, left: 8, top: 8),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;

                  if (state is SearchStart) {
                    return Center(
                      child: Text("Digite um texto"),
                    );
                  }

                  if (state is SearchLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is SearchError) {
                    return Center(
                      child: Text("Houve um error"),
                    );
                  }

                  final list = (state as SearchSuccess).list;

                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        print(item.title ?? "error");
                        return ListTile(
                          leading: item.img == null
                              ? Container()
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(item.img),
                                ),
                          title: Text(item.title ?? ""),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
