// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: InkWell(
                    onTap: () {
                      context.goNamed('/home');
                    },
                    child: Text(
                      'Asosiy /',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ' Sotib olish usuli',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: Divider(),
          ),
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
