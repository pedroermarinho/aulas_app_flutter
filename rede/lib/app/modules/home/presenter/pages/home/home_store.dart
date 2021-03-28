import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:rede/app/modules/home/domain/model/setor_model.dart';
import 'package:rede/app/modules/home/external/stores/rede_store.dart';
import 'package:rede/app/modules/home/presenter/components/setor/setor.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final RedeStore _redeStore = RedeStore();

  @observable
  ObservableList<Widget> listWidget = ObservableList();

  gerarDados() {
    gerarSetor(_redeStore.setorCentral);
  }

  @action
  gerarSetor(SetorModel setorModel) {
    listWidget.clear();
    for (var setor in setorModel.listMaquina) {
      listWidget.add(
        Setor(
          status: false,
          setorModel: setor,
          function: () {
            if (setor.listMaquina.isNotEmpty) {
              gerarSetor(setor);
            }
          },
        ),
      );
    }
  }

  pesquisa(String ip) {
    if (ip.isNotEmpty) {
      _pesquisa(ip, _redeStore.setorCentral);
    } else {
      gerarDados();
    }
  }

  @action
  _pesquisa(String ip, setorModel) {
    listWidget.clear();
    for (SetorModel setor in setorModel.listMaquina) {
      listWidget.add(
        Setor(
          status: _pesquisaValue(ip, setor),
          setorModel: setor,
          function: () {
            if (setor.listMaquina.isNotEmpty) {
              _pesquisa(ip, setor);
            }
          },
        ),
      );
    }
  }

  bool _pesquisaValue(String ip, setorModel) {
    if (setorModel.ip.contains(ip)) {
      return true;
    }

    for (SetorModel setor in setorModel.listMaquina) {
      if (setor.ip.contains(ip)) {
        return true;
      }
      if (_pesquisaValue(ip, setor)) {
        return true;
      }
    }
    return false;
  }
}
