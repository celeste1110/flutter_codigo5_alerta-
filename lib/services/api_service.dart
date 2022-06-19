import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../helpers/sp_global.dart';
import '../models/alert1_model.dart';
import '../models/alert_aux_model.dart';
import '../models/alert_model.dart';
import '../models/user_model.dart';
import '../utils/contanst.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class APIService {
  SPGlobal spGlobal = SPGlobal();


  Future<UserModel?> login(String username, String password) async{
    String _path = pathProduction + "/login/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.post(
      _uri,
      headers: {
        "Content-Type": "application/json",

      },
      body: json.encode(
        {
          "username": username,
          "password": password
        },
      ),
    );
    if(response.statusCode == 200){
      Map<String, dynamic> userMap = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(userMap["user"]);
      userModel.token = userMap["access"];
      spGlobal.token=userModel.token!;
      spGlobal.isLogin=true;

      return userModel;
    }
    return null;
  }

  Future<List<AlertModel>> getAlerts() async {
    String path =
        "http://alertahunter.herokuapp.com/API/noticias/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      String source=const Utf8Decoder().convert(response.bodyBytes);
     List myMap = json.decode(source);

      List<AlertModel> alertsList =
      myMap.map<AlertModel>((e) => AlertModel.fromJson(e)).toList();
      print(alertsList);
      return alertsList;
    }
    return [];
  }
  Future<AlertModel?> updateNews(AlertModel newModel)async{
    String _path = pathProduction + "/noticias/${newModel.id}/";
    Uri _uri = Uri.parse(_path);
    http.Response response=await http.patch(
      _uri,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "titulo": '${newModel.titulo}',
          "link": '${newModel.link}',
          "fecha":'${newModel.fecha}',

        },
      ),
    );
   if(response.statusCode==200){
     String source=const Utf8Decoder().convert(response.bodyBytes);
     Map<String, dynamic> newsMap = json.decode(source);
     AlertModel alertModel = AlertModel.fromJson(newsMap);
     return alertModel;
    }
   return null;
  }

  Future<AlertModel?>updateNews2(AlertModel newsModel, File? imageNews) async {
    String _path = pathProduction + "/noticias/${newsModel.id}/";
    Uri _uri = Uri.parse(_path);
    final request = http.MultipartRequest("PATCH", _uri);


    if(imageNews != null){
      List<String> mimeType = mime(imageNews.path)!.split("/");
      http.MultipartFile file = await http.MultipartFile.fromPath(
        "imagen",
        imageNews.path,
        contentType: MediaType(mimeType[0], mimeType[1]),
      );
      request.files.add(file);
    }



    request.fields["titulo"] = newsModel.titulo;
    request.fields["link"] = newsModel.link;
    request.fields["fecha"] = newsModel.fecha;


    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    if(response.statusCode==200){
      String source=const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> newsMap = json.decode(source);
      AlertModel alertModel = AlertModel.fromJson(newsMap);
      return alertModel;
    }
    return null;

  }

  Future<AlertModel?>registerNew(AlertModel newsModel, File? imageNews) async {
    String _path = pathProduction + "/noticias/";
    Uri _uri = Uri.parse(_path);
    final request = http.MultipartRequest("POST", _uri);


    if(imageNews != null){
      List<String> mimeType = mime(imageNews.path)!.split("/");
      http.MultipartFile file = await http.MultipartFile.fromPath(
        "imagen",
        imageNews.path,
        contentType: MediaType(mimeType[0], mimeType[1]),
      );
      request.files.add(file);
    }



    request.fields["titulo"] = newsModel.titulo;
    request.fields["link"] = newsModel.link;
    request.fields["fecha"] = newsModel.fecha;


    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    //print(response.statusCode);
    if(response.statusCode==201){
      String source=const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> newsMap = json.decode(source);
      AlertModel alertModel = AlertModel.fromJson(newsMap);
      return alertModel;
    }
    return null;

  }
  Future<List<Alert1Model>> getAlerts1() async{
    String _path = pathProduction + "/incidentes/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      String source = const Utf8Decoder().convert(response.bodyBytes);
      List alerts = json.decode(source);
      List<Alert1Model> alertModelList = alerts.map((e) => Alert1Model.fromJson(e)).toList();
      //print(alertModelList);
      return alertModelList;
    }
    return [];
  }

  Future<List<TipoIncidente>> getTypeAlerts() async{
    String _path = pathProduction + "/incidentes/tipos/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      String source = const Utf8Decoder().convert(response.bodyBytes);
      List typeAlerts = json.decode(source);
      List<TipoIncidente> typeAlertModelList = typeAlerts.map((e) => TipoIncidente.fromJson(e)).toList();
      print(typeAlertModelList);
      return typeAlertModelList;
    }
    return [];
  }

  registerAlert(AlertAuxModel alertAuxModel) async {
    String _path = pathProduction + "/incidentes/crear/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.post(
      _uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${spGlobal.token}",
      },
      body: json.encode(alertAuxModel.toJson()),
    );
    print(response.statusCode);
  }



}

