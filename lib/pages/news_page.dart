import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_alerta/ui/general/colors.dart';

import '../models/alert_model.dart';
import '../services/api_service.dart';
import '../ui/widget/item_new_widget.dart';
import 'general_form_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<AlertModel> alertList = [];
  final APIService _apiService = APIService();
  bool isLoading = true;
  @override
  initState() {
    super.initState();
    getData();
  }

  getData()  {
    // _apiService.getMovies().then((value) {
    //   moviesList = value;
    //   setState(() {
    //
    //   });
    // });
    isLoading = true;
    setState(() {});
    _apiService.getAlerts().then((value) {
      alertList = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        title: Text('Notocias'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBrandSecondaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GeneralFormPage(isNew: true),
            ),
          ).then((value) {
            getData();
          });
        },
      ),
      body: !isLoading
          ? ListView.builder(
              itemCount: alertList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemNewsWidget(
                  alerModel: alertList[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GeneralFormPage(newModel: alertList[index],isNew: false),
                      ),
                    ).then((value) => {
                          getData(),
                        });
                  },
                );
              },
              // body: SingleChildScrollView(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Column(
              //       children: alertList
              //           .map(
              //             (e) => Container(
              //                 margin: const EdgeInsets.only(bottom: 10),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Container(
              //                       height: 130,
              //                       width: double.infinity,
              //                       child: Image.network(
              //                         e.imagen,
              //                         fit: BoxFit.cover,
              //                         errorBuilder: (BuildContext context,
              //                             Object exception, StackTrace? stackTrace) {
              //                           return Image.network(
              //                             'https://images.pexels.com/photos/2308815/pexels-photo-2308815.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              //                             fit: BoxFit.cover,
              //                           );
              //                         },
              //                       ),
              //                     ),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Expanded(
              //                           child: Text(
              //                             e.titulo,
              //                             maxLines: 2,
              //                           ),
              //                         ),
              //                         Text(e.fecha.toString().substring(0, 10))
              //                       ],
              //                     )
              //                   ],
              //                 )),
              //           )
              //           .toList(),
              //     ),
              //   ),
              // ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
