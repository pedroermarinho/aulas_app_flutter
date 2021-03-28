import 'package:builder/models/filho_model.dart';
import 'package:builder/models/funcionario_model.dart';

class FuncionarioBuilder {
  final FuncionarioModel _funcionario = FuncionarioModel();

  FuncionarioBuilder._();

  static FuncionarioBuilder get instance => FuncionarioBuilder._();

  FuncionarioBuilder nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  FuncionarioBuilder idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  FuncionarioBuilder profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  FuncionarioBuilder addFilho(FilhoModel filho) {
    _funcionario.filhos ??= [];
    _funcionario.filhos.add(filho);
    return this;
  }

  FuncionarioModel build() {
    return _funcionario;
  }
}
