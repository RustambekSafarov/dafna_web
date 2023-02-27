import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';

import '../footer.dart';

class Afzalliklar extends StatelessWidget {
  const Afzalliklar({super.key});
  static const routeName = '/afzalliklar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Image.network('https://telegra.ph/file/56b7827ae5dfaedc6a12f.jpg'),
          const SizedBox(
            height: 100,
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.blue,
            width: double.infinity,
            height: 320,
            child: const Footer(),
          ),
        ],
      ),
    );
  }
}
