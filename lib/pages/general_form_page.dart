import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_alerta/ui/general/colors.dart';
import 'package:flutter_codigo5_alerta/ui/widget/input_textfield_widget.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import '../models/alert_model.dart';
import '../services/api_service.dart';
import '../ui/widget/bottom_normal_widget.dart';
import '../ui/widget/general_widget.dart';
import '../utils/contanst.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GeneralFormPage extends StatefulWidget {
  AlertModel? newModel;
  bool isNew;

  GeneralFormPage({this.newModel, required this.isNew});

  @override
  State<GeneralFormPage> createState() => _GeneralFormPageState();
}

class _GeneralFormPageState extends State<GeneralFormPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  final APIService _apiService = APIService();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;
  XFile? imageNews;

  @override
  void initState() {
    super.initState();
    if (widget.newModel != null) {
      _titleController.text = widget.newModel!.titulo;
      _linkController.text = widget.newModel!.link;
      _dateController.text = widget.newModel!.fecha;
    }
  }

  _save() async{
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      AlertModel newsModel = AlertModel(

        link: _linkController.text,
        titulo: _titleController.text,
        fecha: _dateController.text,
        imagen: "",
      );
      File? _image = imageNews == null ? null : File(imageNews!.path);
      if(_image!=null){
      _image = await FlutterNativeImage.compressImage(_image.path,
            quality: 50,);
        print(_image.lengthSync());
      }

      if(widget.isNew){
        _apiService.registerNew(newsModel, _image).then((value){
          if (value != null) {
            snackBarMessage(context, TypeMessage.succes);
            Navigator.pop(context);
          } else {
            isLoading = false;
            snackBarMessage(context, TypeMessage.error);
            setState(() {});
          }
        });

      }else{

        newsModel.id = widget.newModel!.id;

        _apiService.updateNews2(newsModel, _image).then((value) {
          if (value != null) {
            snackBarMessage(context, TypeMessage.succes);
            Navigator.pop(context);
          } else {
            isLoading = false;
            snackBarMessage(context, TypeMessage.error);
            setState(() {});
          }
        });
      }



      _apiService.updateNews2(newsModel,_image).then((value) {
        if (value != null) {
          snackBarMessage(context, TypeMessage.succes);
          Navigator.pop(context);
        } else {
          isLoading = false;
          snackBarMessage(context, TypeMessage.error);
          setState(() {});
        }
      });
    }
  }
  getImageGallery() async{
    XFile? imageXFile=await _picker.pickImage(source: ImageSource.gallery);

      imageNews = imageXFile;
      setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBrandSecondaryColor,
        title: Text('Form'),
        actions: [
          IconButton(
            onPressed: () {

              getImageGallery();

            },
            icon: Icon(
              Icons.image,
            ),
          ),
        ],
      ),
      body: !isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextFieldWidget(
                        hintText: 'Titulo',
                        controller: _titleController,
                      ),
                      InputTextFieldWidget(
                        hintText: 'Link',
                        controller: _linkController,
                      ),
                      InputTextFieldWidget(
                        hintText: 'Fecha',
                        controller: _dateController,
                        isSelecDate: true,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        width: double.infinity,
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: imageNews == null
                              ? Image.asset(
                            "assets/images/imgx1.jpeg",
                            fit: BoxFit.cover,
                          )
                              : Image.file(
                            File(imageNews!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      divider20(),
                      ButtomNormalWidget(
                        title: "Guardar",
                        onPressed: () {
                          _save();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
