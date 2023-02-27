import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../footer.dart';

class Buyurtma extends StatelessWidget {
  const Buyurtma({super.key});
  static const routeName = '/buyurtma';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Image.network('https://telegra.ph/file/cbee97cfe3e88abf80e9c.jpg'),
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
