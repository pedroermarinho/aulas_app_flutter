// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$listWidgetAtom = Atom(name: 'HomeStoreBase.listWidget');

  @override
  ObservableList<Widget> get listWidget {
    _$listWidgetAtom.reportRead();
    return super.listWidget;
  }

  @override
  set listWidget(ObservableList<Widget> value) {
    _$listWidgetAtom.reportWrite(value, super.listWidget, () {
      super.listWidget = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic gerarDados() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.gerarDados');
    try {
      return super.gerarDados();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listWidget: ${listWidget}
    ''';
  }
}
