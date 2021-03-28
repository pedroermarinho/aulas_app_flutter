class FilhoModel {
  String nome;
  int idade;
  FilhoModel({
    this.nome,
    this.idade,
  });

  @override
  String toString() {
    return 'nome:${nome}, idade:${idade}';
  }
}
