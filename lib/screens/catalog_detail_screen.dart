import 'package:dafna_web/screens/catalog_screen.dart';
import 'package:dafna_web/service/get_service.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogDetailScreen extends StatelessWidget with ChangeNotifier {
  int? catalogId;
  CatalogDetailScreen({super.key, required this.catalogId});
  static const routeName = '/catalog-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: getCatalogType(catalogId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 65, top: 40, bottom: 40),
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
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final productTypeId =
                              snapshot.data!['prodouct_typt'][index]['id'];

                          final productId = snapshot.data!['id'];
                          final productTypeName =
                              snapshot.data!['prodouct_typt'][index]['name'];
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              context.goNamed('/product-detail', extra: [
                                productTypeId,
                                productId,
                                productTypeName
                              ]);
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://ogabek007.pythonanywhere.com/' +
                                        snapshot.data!['prodouct_typt'][index]
                                            ['img_url'],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  snapshot.data!['prodouct_typt'][index]['name']
                                      .toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
                return const Center(
                  child: Text('Own code error'),
                );
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
