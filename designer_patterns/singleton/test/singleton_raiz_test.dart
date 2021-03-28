import 'package:singleton/singleton_raiz.dart';
import 'package:test/test.dart';

int main() {
  test('deve retornar o msm id', () {
    final id1 = SingletonRaiz.instance.id;
    final id2 = SingletonRaiz.instance.id;

    expect(id1, id2);
  });
  return 0;
}
