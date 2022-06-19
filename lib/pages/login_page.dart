import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_alerta/services/api_service.dart';
import 'package:flutter_codigo5_alerta/ui/general/colors.dart';
import 'package:flutter_codigo5_alerta/ui/widget/general_widget.dart';
import 'package:flutter_codigo5_alerta/utils/contanst.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/widget/bottom_normal_widget.dart';
import '../ui/widget/input_textfield_password_widget.dart';
import '../ui/widget/input_textfield_widget.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final APIService _apiService = APIService();
  bool isLoading = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      _apiService
          .login(_dniController.text, _passwordController.text)
          .then((value) {
        if (value != null) {
          isLoading = false;
          setState(() {});
          snackBarMessage(context, TypeMessage.loginSucces);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
        } else {
          snackBarMessage(context, TypeMessage.error);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body:
           Stack(
             children: [
               SafeArea(
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.all(16),
                     child: Form(
                       key: _formKey,
                       child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           divider30(),
                           SvgPicture.asset(
                             'assets/images/imagen2.svg',
                             height: 100,
                           ),
                           divider30(),
                           Text(
                             'Bienvenido',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 28,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                           Text(
                             'Por favor, ingresa tus credenciales',
                             style: TextStyle(color: Colors.white),
                           ),
                           divider12(),
                           InputTextFieldWidget(
                             hintText: 'Nro DNI',
                             maxLength: 8,
                             textInputType: TextInputType.number,
                             controller: _dniController,
                           ),
                           InputTextFieldPasswordWidget(
                             controller: _passwordController,
                           ),
                           divider12(),
                           ButtomNormalWidget(
                             title: "Iniciar Sesión",
                             onPressed: () {
                               _login();
                             },
                           ),
                           divider20(),
                           RichText(
                             text: TextSpan(
                               text: '¿Aun no estas registrado?',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.white54,
                               ),
                               children: [
                                 TextSpan(
                                   text: ' Registrate',
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w600,
                                       color: Color(0xff5468FF)),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
               isLoading?Container(
                 color: kBrandSecondaryColor,
                 child: Center(
                   child: SizedBox(
                     width: 20,
                     height: 20,
                     child: CircularProgressIndicator(
                       color: kBrandSecondaryColor,
                       strokeWidth: 2.3,
                     ),
                   ),
                 ),
               ):SizedBox(),
             ],

           ),

    );
  }
}
