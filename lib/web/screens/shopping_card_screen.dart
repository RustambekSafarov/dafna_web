import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../models/colors.dart';
import '../service/get_service.dart';
import '../widget/appbar_view.dart';
import '../widget/drawer_view.dart';

class ShoppingCardScreen extends StatelessWidget {
  ShoppingCardScreen({super.key});
  static const routeName = '/shopping-cart';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        toolbarHeight: 122,
        title: AppBarView(),
      ),
      body: Center(
        child: ListView(
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
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    ' Savat',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, bottom: 20),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150),
              child: Text('Savat'),
            ),
            FutureBuilder(
              future: getCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 150, right: 150, top: 20),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!['carts'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            context.goNamed(
                              '/product-info',
                              extra: snapshot.data!['carts'][index]['id'],
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      height: 200,
                                      width: 220,
                                      child: Image.network(
                                        'https://ogabek007.pythonanywhere.com/' +
                                            snapshot.data!['carts'][index]
                                                ['img_url'],
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
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Text(
                                      snapshot.data!['carts'][index]['name']
                                          .toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 120,
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${snapshot.data!['carts'][index]['price']}',
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
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete),
                                          Text(
                                            'O\'chirish',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
      ),
    );
  }
}
