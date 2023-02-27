import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';

import '../footer.dart';

class Savollar extends StatelessWidget {
  const Savollar({super.key});
  static const routeName = '/savollar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Image.network('https://telegra.ph/file/3ff32953bd114bf0f8909.jpg'),
          Image.network('https://telegra.ph/file/9123925e62447a43e75e9.jpg'),
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
