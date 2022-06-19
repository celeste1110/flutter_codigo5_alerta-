
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../general/colors.dart';

class InputTextFieldPasswordWidget extends StatefulWidget {
  TextEditingController controller;
  InputTextFieldPasswordWidget({required this.controller,});
  @override
  State<InputTextFieldPasswordWidget> createState() => _InputTextFieldPasswordWidgetState();
}

class _InputTextFieldPasswordWidgetState extends State<InputTextFieldPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isInvisible,

        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),

        decoration: InputDecoration(
          filled: true,
          fillColor: kBrandSecondaryColor,
          hintText: 'Contraseña',
          hintStyle: TextStyle(
            color: Colors.white38,
            fontSize: 14,
          ),
          counterText: '',
          suffixIcon: IconButton(
            onPressed: (){
              isInvisible = !isInvisible;
              setState(() {

              });

            },
            icon: Icon(
              isInvisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
              color: Colors.white70,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
            errorStyle: TextStyle(
              color: Color(0xffef476f),
            )

        ),
        validator: (String? value){
          if(value!.isEmpty) return 'El campo el obligatorio';
          return null;

        },
      ),
    );
  }
}
