import 'package:dafna_web/screens/product_screen.dart';
import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:dafna_web/widget/recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../widget/appbar_view.dart';

class ProductInfoScreen extends StatelessWidget {
  int? id;
  ProductInfoScreen({super.key, required this.id});
  static const routeName = '/product-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              FutureBuilder(
                future: getProductDetail(id!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 430,
                              width: 410,
                              child: Image.network(
                                snapshot.data!['img_url'],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 50, bottom: 30),
                                  child: Text(
                                    snapshot.data!['name'],
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    '${snapshot.data!['price']} so\'m',
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                          'Menejer bilan mavjudligini tekshiring'),
                                    ),
                                    IconButton(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        color: Colors.red,
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          height: 24,
                                          // width: 24,
                                          child: Image.network(
                                              'https://telegra.ph/file/c8009fb888a661be7f599.png'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          height: 24,
                                          // width: 30,
                                          child: Image.network(
                                              'https://telegra.ph/file/d7cc492c5fac52487f428.png'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          height: 24,
                                          // width: 30,
                                          child: Image.network(
                                              'https://telegra.ph/file/b3bd00aaa9edaca19fb5f.png'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          height: 24,
                                          // width: 30,
                                          child: Image.network(
                                              'https://telegra.ph/file/762fe0d491764eb3c5c2a.png'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Buyurtma berishdan oldin, etkazib berish shartlarini operatorlar bilan tekshiring',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Yetkazib berish bepul: Toshkentda',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Tez yetkazib berish: xarajat menejer tomonidan belgilanadi',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Menejer bilan ushbu modelni boshqa ranglarda tekshirishingiz mumkin.',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ClipRRect(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(0.5),
                                            // offset: Offset(10, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      width: 600,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          snapshot.data!['discrpition'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 65),
                          child: Text('Texnik xususiyatlar'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 65, right: 65),
                          child: Divider(
                            thickness: 0.4,
                            color: Colors.black,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 65, top: 45, bottom: 35),
                          child: Text(
                            'Ehtimol, sizni qiziqtiradi:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Recommendations(),
                        const SizedBox(
                          height: 50,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.topCenter,
                            color: Colors.blue,
                            // width: double.infinity,
                            height: 320,
                            child: const Footer(),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitHourGlass(
                        size: 30,
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return const Center(child: Text('Error'));
                  }
                },
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}
