import 'dart:io';

import 'package:dafna_web/service/get_service.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  static const routeName = '/favorites';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Platform.isAndroid ? Drawer() : null,
      appBar: Platform.isAndroid
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
              title: AppBarView(),
            ),
      body: Platform.isAndroid
          ? FutureBuilder(
              future: getFavorite(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.goNamed(
                          '/product-info',
                          extra: snapshot.data![index]['id'],
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 220,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                  Image.network(
                                    'https://ogabek007.pythonanywhere.com/' +
                                        snapshot.data![index]['img_url'],
                                    fit: BoxFit.cover,
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            child: Text(
                              snapshot.data![index]['name'].toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 220,
                            // padding: const EdgeInsets.all(13.0),
                            child: Text(
                              snapshot.data![index]['discrpition'],
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
                                  '${snapshot.data![index]['price']}',
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
          : kIsWeb
              ? ListView(
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
                            ' Sevimlilar',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, right: 150),
                      child: Divider(),
                    ),
                    FutureBuilder(
                      future: getFavorite(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 65, right: 65, top: 20),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 0.5,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      context.goNamed(
                                        '/product-info',
                                        extra: snapshot.data![index]['id'],
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: SizedBox(
                                            height: 220,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                        Icons.favorite_border),
                                                  ),
                                                ),
                                                Image.network(
                                                  'https://ogabek007.pythonanywhere.com/' +
                                                      snapshot.data![index]
                                                          ['img_url'],
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Image.network(
                                                      'https://telegra.ph/file/a775320534f348ae7f531.png',
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 70,
                                          child: Text(
                                            snapshot.data![index]['name']
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 15.5,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          width: 220,
                                          // padding: const EdgeInsets.all(13.0),
                                          child: Text(
                                            snapshot.data![index]
                                                ['discrpition'],
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${snapshot.data![index]['price']}',
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
                                  );
                                }),
                          );
                          ;
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
                )
              : Container(),
    );
  }
}
