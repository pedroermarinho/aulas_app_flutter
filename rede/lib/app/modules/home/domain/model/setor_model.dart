class SetorModel {
  final String nome;
  final String ip;
  final Type type;
  final List<SetorModel> listMaquina;

  SetorModel({
    required this.nome,
    required this.ip,
    required this.type,
    required this.listMaquina,
  });
}

enum Type { Switch, Roteador, PC, Sevidor, Modem }
