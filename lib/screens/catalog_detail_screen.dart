import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CatalogDetailScreen extends StatelessWidget {
  const CatalogDetailScreen({super.key});
  static const routeName = '/catalog-detail';

  @override
  Widget build(BuildContext context) {
    final routeId =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: const AppBarView(),
      ),
      body: FutureBuilder(
        future: getCatalogType(routeId['id']!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 65, top: 40, bottom: 40),
                  child: Text(
                    snapshot.data!['discrpition'],
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65, right: 30),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!['prodouct_typt'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        String id = snapshot.data!['prodouct_typt'][index]['id']
                            .toString();
                        String id2 = snapshot.data!['id'].toString();
                        String name =
                            snapshot.data!['prodouct_typt'][index]['name'];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/product-detail', arguments: {
                              'id': id,
                              'id2': id2,
                              'name': name
                            });
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  snapshot.data!['prodouct_typt'][index]
                                      ['img_url'],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                snapshot.data!['prodouct_typt'][index]['name'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitThreeBounce(
                size: 30,
                color: Colors.black,
              ),
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
