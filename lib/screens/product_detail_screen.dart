import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:dafna_web/widget/recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widget/appbar_view.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({super.key});
  static const routeName = '/product-detail';

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
          FutureBuilder(
            future: getProductDetail(1),
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
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 30),
                              child: Text(
                                snapshot.data!['name'],
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                '${snapshot.data!['price']} so\'m',
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
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
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  height: 24,
                                  // width: 24,
                                  child: Image.network(
                                      'https://telegra.ph/file/c8009fb888a661be7f599.png'),
                                ),
                                const Text(
                                  'Buyurtma berishdan oldin, etkazib berish shartlarini operatorlar bilan tekshiring',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  height: 24,
                                  // width: 30,
                                  child: Image.network(
                                      'https://telegra.ph/file/d7cc492c5fac52487f428.png'),
                                ),
                                const Text(
                                  ' Yetkazib berish bepul: Toshkentda',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  height: 24,
                                  // width: 30,
                                  child: Image.network(
                                      'https://telegra.ph/file/b3bd00aaa9edaca19fb5f.png'),
                                ),
                                const Text(
                                  'Tez yetkazib berish: xarajat menejer tomonidan belgilanadi',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  height: 24,
                                  // width: 30,
                                  child: Image.network(
                                      'https://telegra.ph/file/762fe0d491764eb3c5c2a.png'),
                                ),
                                const Text(
                                  '  Menejer bilan ushbu modelni boshqa ranglarda tekshirishingiz mumkin.',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              elevation: 10,
                              shadowColor: Colors.blue,
                              child: ClipRRect(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
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
                              ),
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
                      padding: EdgeInsets.only(left: 65, top: 45, bottom: 35),
                      child: Text(
                        'Ehtimol, sizni qiziqtiradi:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Recommendations(),
                    const SizedBox(
                      height: 50,
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
                return const Center(child: Text('Error'));
              }
            },
          ),
        ],
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}
