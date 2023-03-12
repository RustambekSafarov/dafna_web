// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../service/get_service.dart';
import '../widget/appbar_view.dart';

class CatalogScreen extends StatelessWidget with ChangeNotifier {
  CatalogScreen({super.key});
  static const routeName = '/catalog';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: defaultTargetPlatform == TargetPlatform.android ? Drawer() : null,
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
              title: const AppBarView(),
              toolbarHeight: 122,
            ),
      body: defaultTargetPlatform == TargetPlatform.android
          ? ListView(
              children: [
                FutureBuilder(
                  future: getCatalog(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                context.goNamed('/catalog-detail',
                                    extra: snapshot.data![index]['id']);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://ogabek007.pythonanywhere.com/' +
                                        snapshot.data![index]['img_url'],
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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
                      return Center(child: Text('Network Error!'));
                    }
                  },
                )
              ],
            )
          : ListView(
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                'https://ogabek007.pythonanywhere.com/' +
                                    snapshot.data![index]['img_url'],
                                fit: BoxFit.fitWidth,
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
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
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
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Center(
                        child: Text('You have not internet!'),
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
      bottomNavigationBar: Platform.isAndroid
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
