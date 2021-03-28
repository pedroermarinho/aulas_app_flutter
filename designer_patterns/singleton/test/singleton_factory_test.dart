import 'package:singleton/singleton_factory.dart';
import 'package:test/test.dart';

int main() {
  test('deve retornar o msm id', () {
    final instance1 = SingletonFactory();
    final instance2 = SingletonFactory();

    expect(instance1.id, instance2.id);
  });
  return 0;
}
