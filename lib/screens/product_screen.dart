import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 65, top: 40, bottom: 40),
            child: Text(
              routeArgs['name']!,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: getCatalogType(int.parse(routeArgs['id2']!)),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 65, top: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!['prodouct_typt'].length,
                          itemBuilder: (context, index) => InkWell(
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                snapshot.data!['prodouct_typt'][index]['name'],
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitThreeBounce(
                          size: 30,
                          color: Colors.black,
                        ),
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: FutureBuilder(
                  future: getProducts(int.parse(routeArgs['id']!)),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 65, top: 20),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot
                              .data!['prodouct_type']['prodoucts'].length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.53,
                          ),
                          itemBuilder: (context, index) => InkWell(
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/product-detail');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    height: 220,
                                    child: Image.network(
                                      snapshot.data!['prodouct_type']
                                          ['prodoucts'][index]['img_url'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!['prodouct_type']['prodoucts']
                                          [index]['name']
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.w900),
                                ),
                                Container(
                                  height: 150,
                                  width: 220,
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(
                                    snapshot.data!['prodouct_type']['prodoucts']
                                        [index]['discrpition'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${snapshot.data!['prodouct_type']['prodoucts'][index]['price']}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        ' so\'m',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitThreeBounce(
                          size: 30,
                          color: Colors.black,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          // const Footer()
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}
