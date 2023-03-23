import 'package:dafna_web/web/service/get_service.dart';
import 'package:dafna_web/web/widget/appbar_view.dart';
import 'package:dafna_web/web/widget/drawer_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../models/colors.dart';

class SearchResultScreen extends StatelessWidget {
  String value;
  SearchResultScreen({super.key, required this.value});
  static const routeName = '/search-result';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        toolbarHeight: 122,
        title: AppBarView(),
      ),
      body: ListView(
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
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  '/ Qidiruv natijalari',
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
            future: getSearch(value),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        context.goNamed('/product-info',
                            extra: snapshot.data![index]['id']);
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
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 500,
                  child: Center(
                    child: SpinKitHourGlass(
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'So\'rovingiz bo\'yicha hech narsa topilmadi!',
                    style: TextStyle(fontSize: 22),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
