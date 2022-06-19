
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/general/colors.dart';

String pathProduction='http://alertahunter.herokuapp.com/API';

enum TypeMessage{
  succes,
  error,
  loginSucces
}
Map<TypeMessage,String> messages={
  TypeMessage.loginSucces:'Bienvenido, tus credenciales son correctas',
  TypeMessage.succes:'---',
  TypeMessage.error:'Hubo un incoveniente, por favor intentalo nuevamente',
};

Map<TypeMessage,Color> messageColor={
  TypeMessage.loginSucces:kSuccesColor,
  TypeMessage.succes:kSuccesColor,
  TypeMessage.error:kErrorColor,
};

Map<TypeMessage,IconData> messageIcon={
  TypeMessage.loginSucces:Icons.check_circle_outline,
  TypeMessage.succes:Icons.check_circle_outline,
  TypeMessage.error:Icons.error_outline,
};