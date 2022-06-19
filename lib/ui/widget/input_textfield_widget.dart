import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../general/colors.dart';

class InputTextFieldWidget extends StatelessWidget {
  String hintText;
  int? maxLength;
  TextInputType? textInputType;
  TextEditingController controller;
  bool? isSelecDate;
  InputTextFieldWidget(
      {required this.hintText,
      this.maxLength,
      this.textInputType,
      required this.controller,
      this.isSelecDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
          onTap: isSelecDate != null ?() async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? datePicker = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(200),
              lastDate: DateTime(
                2030,
              ),
            );
            if(datePicker!=null){
              controller.text=datePicker.toString().substring(0,10);
            }

          }: null,
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          maxLength: maxLength,
          inputFormatters: maxLength != null
              ? [
                  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true),
                ]
              : [],
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff262A34),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white38,
                fontSize: 14,
              ),
              counterText: '',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none),
              errorStyle: TextStyle(
                color: Color(0xffef476f),
              )),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'El campo el obligatorio';
            } else {
              if (maxLength != null) {
                if (value.length < 8) return 'El dni debe tener 8 digitos';
                return null;
              }
              return null;
            }
          }),
    );
  }
}
