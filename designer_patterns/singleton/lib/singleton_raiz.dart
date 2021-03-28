import 'dart:math';

class SingletonRaiz {
  static SingletonRaiz _instance;
  final id = Random().nextInt(100);

  SingletonRaiz._();

  static SingletonRaiz get instance {
    _instance ??= SingletonRaiz._();
    return _instance;
  }
}
