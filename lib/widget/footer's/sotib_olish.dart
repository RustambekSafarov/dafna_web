import 'package:flutter/material.dart';

import '../appbar_view.dart';
import '../footer.dart';

class SotibOlish extends StatelessWidget {
  const SotibOlish({super.key});
  static const routeName = '/sotib-olish';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Image.network('https://telegra.ph/file/5f6a5bdaee7fa44e8ac33.jpg'),
          Image.network('https://telegra.ph/file/13083affde03360f01801.jpg'),
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
