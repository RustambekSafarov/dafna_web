import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';

import '../footer.dart';

class Tolov extends StatelessWidget {
  const Tolov({super.key});
  static const routeName = '/tolov';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Image.network('https://telegra.ph/file/ab706c81a4104de29d763.jpg'),
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
