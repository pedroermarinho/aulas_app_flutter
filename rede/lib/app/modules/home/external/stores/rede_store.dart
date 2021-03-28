import 'package:mobx/mobx.dart';
import 'package:rede/app/modules/home/domain/model/setor_model.dart';

part 'rede_store.g.dart';

class RedeStore = _RedeStoreBase with _$RedeStore;

abstract class _RedeStoreBase with Store {
  @observable
  SetorModel setorCentral = SetorModel(
    nome: "Modem",
    ip: "190.000.000",
    type: Type.Switch,
    listMaquina: [
      SetorModel(
        nome: "Central",
        type: Type.Switch,
        ip: "192.000.000",
        listMaquina: [
          SetorModel(
            nome: "Servidor",
            ip: "192.000.001",
            type: Type.Sevidor,
            listMaquina: [
              SetorModel(
                nome: "Terminal",
                ip: "192.000.002",
                type: Type.PC,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "Diretoria",
            ip: "192.001.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.001.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "Roteador",
                ip: "192.001.002",
                type: Type.Roteador,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "Logistica",
            ip: "192.002.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.002.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "Roteador",
                ip: "192.002.002",
                type: Type.Roteador,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "Atendimento",
            ip: "192.003.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.003.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.003.002",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.003.003",
                type: Type.PC,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "Setor de Ti",
            ip: "192.004.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.004.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.004.002",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.004.003",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "Roteador",
                ip: "192.004.004",
                type: Type.Roteador,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "Administração",
            ip: "192.005.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.005.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.005.002",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.005.003",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "Roteador",
                ip: "192.005.004",
                type: Type.Roteador,
                listMaquina: [],
              ),
            ],
          ),
          SetorModel(
            nome: "RH",
            ip: "192.006.000",
            type: Type.Switch,
            listMaquina: [
              SetorModel(
                nome: "PC",
                ip: "192.006.001",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.006.002",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "PC",
                ip: "192.006.003",
                type: Type.PC,
                listMaquina: [],
              ),
              SetorModel(
                nome: "Roteador",
                ip: "192.006.004",
                type: Type.Roteador,
                listMaquina: [],
              ),
            ],
          ),
        ],
      )
    ],
  );
}
