// ignore_for_file: prefer_const_constructors

import 'package:dafna_web/web/widget/appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  ' Tolov usuli',
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
