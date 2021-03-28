import 'package:builder/builders/funcionario_builder.dart';
import 'package:builder/builders/funcionario_bulder_completo.dart';
import 'package:builder/dio/custom_dio_builder.dart';
import 'package:builder/models/filho_model.dart';

Future<int> main() async {
  final funcionario1 = FuncionarioBuilder.instance
      .nome('fulano')
      .addFilho(FilhoModel(nome: 'filho1', idade: 12))
      .profissao('estudante')
      .idade(18)
      .addFilho(FilhoModel(nome: 'filho 2', idade: 13))
      .build();

  print(funcionario1);

  final funcionario2 = FuncionarioBuilderCompleto.instance
      .nome('fulando')
      .idade(12)
      .profissao('nao sei')
      .addFilho(FilhoModel(nome: 'filho1', idade: 12))
      .addFilho(FilhoModel(nome: 'filho 2', idade: 13))
      .build();

  print(funcionario2);

  print('####################################');
  print('post');
  final resultPost = await CustomDioBuilder.instance
      .post()
      .path('https://jsonplaceholder.typicode.com/posts')
      .addHeadrs('Content-type', 'application/json')
      .params()
      .data({'title': 'titulox', 'body': 'Bodyx', 'userId': 1}).run();

  print(resultPost.data.toString());

  print('####################################');
  print('get');
  final resultGet = await CustomDioBuilder.instance
      .get()
      .path('https://jsonplaceholder.typicode.com/posts')
      .params()
      .queryParameters()
      .addQueryParam('userId', 1)
      .run();

  print(resultGet.data.toString());
  return 0;
}
