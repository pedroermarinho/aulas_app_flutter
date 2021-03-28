import 'package:builder/models/filho_model.dart';

class FuncionarioModel {
  String nome;
  int idade;
  String profissao;
  List<FilhoModel> filhos;

  @override
  String toString() {
    return 'nome:${nome}, idade:${idade}, profissao:${profissao}, filhos:${filhos?.toString()}';
  }
}
