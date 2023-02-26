import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../service/dafna_api.dart';
import '../widget/appbar_view.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});
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
                      Navigator.pushReplacementNamed(context, '/catalog-detail',
                          arguments: {'id': index + 1});
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
                return const Center(
                  child: SpinKitThreeBounce(
                    size: 30,
                    color: Colors.black,
                  ),
                );
              } else {
                throw Exception('Error a');
              }
            },
          ),
          // const Positioned(
          //   bottom: 1,
          //   child:
          // Footer(),
          // ),
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}
