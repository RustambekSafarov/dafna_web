// ignore_for_file: must_be_immutable
import 'package:dafna_web/web/widget/appbar_view.dart';
import 'package:dafna_web/web/widget/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/get_service.dart';

class CatalogDetailScreen extends StatelessWidget with ChangeNotifier {
  int? catalogId;
  CatalogDetailScreen({super.key, required this.catalogId});
  static const routeName = '/catalog-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        toolbarHeight: 120.1,
        title: AppBarView(),
      ),
      body: Center(
        child: ListView(
          children: [
            FutureBuilder(
              future: getCatalogType(catalogId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  'Asosiy ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text('/'),
                            InkWell(
                              onTap: () {
                                context.goNamed('/catalog');
                              },
                              child: Text(
                                ' Katalog ',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text('/ '),
                            Text(
                              snapshot.data!['discrpition'],
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150, right: 150),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 65, top: 40, bottom: 40),
                        child: Text(
                          snapshot.data!['discrpition'],
                          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 65, right: 30),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!['prodouct_typt'].length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            final productTypeId = snapshot.data!['prodouct_typt'][index]['id'];

                            final productId = snapshot.data!['id'];
                            final productTypeName = snapshot.data!['prodouct_typt'][index]['name'];
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                context.goNamed('/product-detail', extra: [productTypeId, productId, productTypeName]);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: 200,
                                      height: 150,
                                      child: Image.network(
                                        'https://ogabek007.pythonanywhere.com/' + snapshot.data!['prodouct_typt'][index]['img_url'],
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Image.network(
                                            'https://telegra.ph/file/a775320534f348ae7f531.png',
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    snapshot.data!['prodouct_typt'][index]['name'].toUpperCase(),
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
      ),
      bottomNavigationBar: defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS
          ? BottomAppBar(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      FontAwesomeIcons.house,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.goNamed('/home');
                    },
                  ),
                  IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      FontAwesomeIcons.barsStaggered,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.goNamed('/catalog');
                    },
                  ),
                  IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      FontAwesomeIcons.basketShopping,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.goNamed('/shopping-cart');
                    },
                  ),
                  IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      FontAwesomeIcons.heartCircleCheck,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.goNamed('/favorites');
                    },
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
