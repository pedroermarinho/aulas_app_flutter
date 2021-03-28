import 'package:flutter/material.dart';
import 'package:rede/app/modules/home/domain/model/setor_model.dart';

class Setor extends StatelessWidget {
  final SetorModel setorModel;
  final bool status;
  final Function function;

  const Setor({
    required this.setorModel,
    required this.status,
    required this.function,
  });

  String _image(Type type) {
    switch (type) {
      case Type.PC:
        return "assets/pc.png";
      case Type.Roteador:
        return "assets/router.png";
      case Type.Sevidor:
        return "assets/servidor.png";
      case Type.Switch:
        return "assets/switch.png";
      default:
        return "assets/pc.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: SizedBox(
        width: 400,
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${setorModel.nome}",
                style: Theme.of(context).textTheme.headline5,
              ),
              Image.asset(
                _image(setorModel.type),
                width: setorModel.type == Type.Sevidor ? 115 : 180,
              ),
              Column(
                children: [
                  Icon(
                    Icons.online_prediction,
                    size: 35,
                    color: status ? Colors.green : Colors.grey,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${setorModel.ip}",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
