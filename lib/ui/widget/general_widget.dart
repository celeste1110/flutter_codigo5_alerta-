
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/contanst.dart';
import '../general/colors.dart';

SizedBox divider12()=>const SizedBox(height: 12,);
SizedBox divider20()=>const SizedBox(height: 20,);
SizedBox divider30()=>const SizedBox(height: 30,);
SizedBox divider40()=>const SizedBox(height: 40,);

void snackBarMessage(BuildContext context, TypeMessage typeMessage){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: messageColor[typeMessage],
      content: Row(
        children: [
          Icon(
            messageIcon[typeMessage],
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              messages[typeMessage]!,
            ),
          ),
        ],
      ),
    ),
  );
}