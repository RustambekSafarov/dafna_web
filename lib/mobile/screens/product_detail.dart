// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';
import '../../services/post_service.dart';

class ProductDetailScreenM extends StatefulWidget {
  int? id;
  ProductDetailScreenM({
    super.key,
    required this.id,
  });
  static const routeName = '/product-detail';

  @override
  State<ProductDetailScreenM> createState() => _ProductDetailScreenMState();
}

class _ProductDetailScreenMState extends State<ProductDetailScreenM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About prodouct'),
        leading: InkWell(
            onTap: () {
              context.goNamed('/home');
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView(
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
                        'https://ogabek007.pythonanywhere.com/' + snapshot.data!['img_url'],
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
                    Container(
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Text(
                        snapshot.data!['name'],
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        '${snapshot.data!['price']} so\'m',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                          icon: Icon(snapshot.data!['like'] == false ? Icons.favorite_border : Icons.favorite),
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
                                child: Image.network('https://telegra.ph/file/c8009fb888a661be7f599.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                height: 15,
                                // width: 30,
                                child: Image.network('https://telegra.ph/file/d7cc492c5fac52487f428.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                height: 15,
                                // width: 30,
                                child: Image.network('https://telegra.ph/file/b3bd00aaa9edaca19fb5f.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                height: 15,
                                // width: 30,
                                child: Image.network('https://telegra.ph/file/762fe0d491764eb3c5c2a.png'),
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
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Yetkazib berish bepul: Toshkentda',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tez yetkazib berish: xarajat menejer tomonidan belgilanadi',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Menejer bilan ushbu modelni boshqa ranglarda tekshirishingiz mumkin.',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 9,
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
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    )
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
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
      ),
    );
  }
}
