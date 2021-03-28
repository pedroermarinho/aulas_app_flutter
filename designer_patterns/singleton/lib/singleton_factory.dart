import 'dart:math';

class SingletonFactory {
  static SingletonFactory _instance;
  final id = Random().nextInt(100);

  SingletonFactory._();

  factory SingletonFactory() {
    _instance ??= SingletonFactory._();

    return _instance;
  }
}
