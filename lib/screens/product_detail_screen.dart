import 'dart:io';

import 'package:dafna_web/screens/product_screen.dart';
import 'package:dafna_web/service/get_service.dart';
import 'package:dafna_web/service/post_service.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:dafna_web/widget/recommended.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../service/get_service.dart';

import '../widget/appbar_view.dart';

class ProductInfoScreen extends StatefulWidget {
  int? id;
  ProductInfoScreen({super.key, required this.id});
  static const routeName = '/product-info';

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: defaultTargetPlatform == TargetPlatform.android ? Drawer() : null,
      backgroundColor: Colors.white,
      appBar: defaultTargetPlatform == TargetPlatform.android
          ? AppBar(
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 40),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  height: 45,
                  child: TextField(
                    onSubmitted: (value) {
                      context.goNamed('/search-result', extra: value);
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Men ...ni qidirayabman',

                      // focusColor: Colors.white30,
                      hintStyle: const TextStyle(
                        // height: 50,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                      filled: true,
                      // focusColor: const Color.fromARGB(255, 5, 52, 80),
                      fillColor: const Color(0xFF4bbedd),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),
              title: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      child: Image.network(
                        'https://telegra.ph/file/dc9cba1fd9f3f1b63d1d0.png',
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
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
              toolbarHeight: 60,
            )
          : AppBar(
              toolbarHeight: 122,
              title: const AppBarView(),
            ),
      body: defaultTargetPlatform == TargetPlatform.android
          ? ListView(
              children: [
                FutureBuilder(
                  future: getProductDetail(widget.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                              'https://ogabek007.pythonanywhere.com/' +
                                  snapshot.data!['img_url'],
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Image.network(
                                  'https://telegra.ph/file/a775320534f348ae7f531.png',
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 50, bottom: 30),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    addCard(snapshot.data!['id']);
                                  });
                                },
                                // ignore: prefer_const_constructors
                                child: Text('Savatga qo\'shish'),
                              ),
                              IconButton(
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    addFavorite(snapshot.data!['id']);
                                  });
                                },
                                icon: Icon(snapshot.data!['like'] == false
                                    ? Icons.favorite_border
                                    : Icons.favorite),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      height: 15,
                                      // width: 24,
                                      child: Image.network(
                                          'https://telegra.ph/file/c8009fb888a661be7f599.png'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      height: 15,
                                      // width: 30,
                                      child: Image.network(
                                          'https://telegra.ph/file/d7cc492c5fac52487f428.png'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      height: 15,
                                      // width: 30,
                                      child: Image.network(
                                          'https://telegra.ph/file/b3bd00aaa9edaca19fb5f.png'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      height: 15,
                                      // width: 30,
                                      child: Image.network(
                                          'https://telegra.ph/file/762fe0d491764eb3c5c2a.png'),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Buyurtma berishdan oldin, etkazib berish shartlarini operatorlar bilan tekshiring',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Yetkazib berish bepul: Toshkentda',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Tez yetkazib berish: xarajat menejer tomonidan belgilanadi',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Menejer bilan ushbu modelni boshqa ranglarda tekshirishingiz mumkin.',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withAlpha(50),
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
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: SpinKitHourGlass(
                          color: Colors.black,
                          size: 30,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('Network Error!'),
                      );
                    }
                  },
                )
              ],
            )
          : ListView(
              children: [
                Stack(
                  children: [
                    FutureBuilder(
                      future: getProductDetail(widget.id!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    // flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 50, bottom: 30),
                                      height: 430,
                                      width: 410,
                                      child: Image.network(
                                        'https://ogabek007.pythonanywhere.com/' +
                                            snapshot.data!['img_url'],
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
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
                                  Expanded(
                                    // flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
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
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
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
                                              onPressed: () {
                                                setState(() {
                                                  addCard(snapshot.data!['id']);
                                                });
                                              },
                                              // ignore: prefer_const_constructors
                                              child: Text('Savatga qo\'shish'),
                                            ),
                                            IconButton(
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  addFavorite(
                                                      snapshot.data!['id']);
                                                });
                                              },
                                              icon: Icon(
                                                  snapshot.data!['like'] ==
                                                          false
                                                      ? Icons.favorite_border
                                                      : Icons.favorite),
                                            )
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
                                                      const EdgeInsets.only(
                                                          right: 10),
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
                                                      const EdgeInsets.only(
                                                          right: 10),
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
                                                      const EdgeInsets.only(
                                                          right: 10),
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
                                                      const EdgeInsets.only(
                                                          right: 10),
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
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Yetkazib berish bepul: Toshkentda',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Tez yetkazib berish: xarajat menejer tomonidan belgilanadi',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Menejer bilan ushbu modelni boshqa ranglarda tekshirishingiz mumkin.',
                                                  style: TextStyle(
                                                      color: Colors.blue),
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
                                                    color: Colors.blue
                                                        .withOpacity(0.5),
                                                    // offset: Offset(10, 4),
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              width: 600,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Text(
                                                  snapshot.data!['discrpition'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
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
                                padding: EdgeInsets.only(
                                    left: 65, top: 45, bottom: 35),
                                child: Text(
                                  'Ehtimol, sizni qiziqtiradi:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Recommendations(),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                color: Colors.blue,
                                // width: double.infinity,
                                height: 320,
                                child: const Footer(),
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
                          return const Center(child: Text('Own Code Error'));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: defaultTargetPlatform == TargetPlatform.android
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
                      // context.goNamed('/catalog');
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
