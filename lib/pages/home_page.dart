import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_alerta/pages/alert_page.dart';
import 'package:flutter_codigo5_alerta/ui/general/colors.dart';

import '../ui/widget/item_home_widget.dart';
import 'news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alerta Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ItemHomeWidget(
                title: "Noticias",
                image: "https://images.pexels.com/photos/3856050/pexels-photo-3856050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                toPage: NewsPage(),
              ),
              ItemHomeWidget(
                image:
                    'https://images.pexels.com/photos/2308815/pexels-photo-2308815.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                title: 'Alertas',
                toPage: AlertPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
