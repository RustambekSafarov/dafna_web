// ignore_for_file: prefer_const_constructors

import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../service/dafna_api.dart';
import '../widget/appbar_view.dart';

class CatalogScreen extends StatelessWidget with ChangeNotifier {
  CatalogScreen({super.key});
  static const routeName = '/catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarView(),
        toolbarHeight: 122,
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
                  ' Katalog',
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
          FutureBuilder(
            future: getCatalog(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => InkWell(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      final id = snapshot.data![index]['id'];
                      context.goNamed('/catalog-detail', extra: id);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data![index]['img_url'],
                            ),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 500,
                  child: Center(
                    child: SpinKitHourGlass(
                      // duration: Duration(seconds: 2),
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                throw Exception('Own code error');
              }
            },
          ),
          Container(
            alignment: Alignment.topCenter,
            color: Colors.blue,
            // width: double.infinity,
            height: 320,
            child: const Footer(),
          ),
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}
