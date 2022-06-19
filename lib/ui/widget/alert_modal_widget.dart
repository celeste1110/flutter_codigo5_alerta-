import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/alert1_model.dart';
import '../../models/alert_aux_model.dart';
import '../../services/api_service.dart';
import '../general/colors.dart';
import 'bottom_normal_widget.dart';

class AlertModalWidget extends StatefulWidget {
  List<TipoIncidente> typeAlerts;
  Function(int?) onSelected;
  AlertModalWidget({required this.typeAlerts, required this.onSelected});

  @override
  State<AlertModalWidget> createState() => _AlertModalWidgetState();
}

class _AlertModalWidgetState extends State<AlertModalWidget> {
  int typeAlertValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    typeAlertValue = widget.typeAlerts.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26),
          topLeft: Radius.circular(26),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
              color: kBrandSecondaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          const Text(
            "Por favor, selecciona y envia la alerta correspondiente",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: typeAlertValue,
                isExpanded: true,
                items: widget.typeAlerts
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(
                          e.titulo,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (int? value) {
                  typeAlertValue = value!;
                  print(typeAlertValue);
                  setState(() {});
                },
                // onChanged: widget.onSelected,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ButtomNormalWidget(
            title: "Enviar Alerta",
            onPressed: () {
              APIService apiService = APIService();
              AlertAuxModel alertAuxModel = AlertAuxModel(
                latitud: -16.379511,
                longitud: -71.544748,
                tipoIncidente: typeAlertValue,
                estado: "Abierto",
              );
              apiService.registerAlert(alertAuxModel);
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
