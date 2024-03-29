// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:dafna_web/web/widget/appbar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';

class ProductDetailScreen extends StatefulWidget with ChangeNotifier {
  int? productTypeId;
  int? productId;
  String? productTypeName;
  ProductDetailScreen({
    super.key,
    required this.productTypeId,
    required this.productId,
    required this.productTypeName,
  });
  static const routeName = '/product-detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int number = 0;
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: primaryColor,
          toolbarHeight: 120,
          title: AppBarView(),
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 65, top: 40, bottom: 40),
                child: Text(
                  widget.productTypeName!,
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                      future: getCatalogType(widget.productId!),
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
                                onTap: () {
                                  setState(() {
                                    // widget.productTypeId = snapshot
                                    //     .data!['prodouct_typt'][index]['id'];
                                    number = index;
                                    widget.productTypeName = snapshot.data!['prodouct_typt'][index]['name'];
                                    widget.productTypeId = snapshot.data!['prodouct_typt'][index]['id'];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: number == index ? Colors.lightBlue : null,
                                  ),
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
                        } else if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitHourGlass(
                              size: 30,
                              color: Colors.black,
                            ),
                          );
                        } else {
                          return const Text('Own Code Error');
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureBuilder(
                      future: getProducts(widget.productTypeId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          id = widget.productTypeId!;
                          return Padding(
                            padding: const EdgeInsets.only(left: 15, right: 65, top: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Saralash turi:'),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        height: 35,
                                        width: 85,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue,
                                        ),
                                        child: Center(child: Text('Mashhurlik')),
                                      ),
                                    ),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        height: 35,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue,
                                        ),
                                        child: Center(child: Text('Yangi')),
                                      ),
                                    ),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        height: 35,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue,
                                        ),
                                        child: Center(child: Text('Narxi')),
                                      ),
                                    ),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        height: 35,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue,
                                        ),
                                        child: Center(child: Text('Chegirma')),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!['prodouct_type']['prodoucts'].length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.5, mainAxisSpacing: 20, crossAxisSpacing: 20),
                                    itemBuilder: (context, index) {
                                      widget.productTypeId = snapshot.data!['prodouct_type']['prodoucts'][index]['id'];

                                      return InkWell(
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          context.goNamed('/product-info', extra: widget.productTypeId);
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
                                                      'https://ogabek007.pythonanywhere.com/' + snapshot.data!['prodouct_type']['prodoucts'][index]['img_url'],
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (context, child, loadingProgress) {
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
                                                snapshot.data!['prodouct_type']['prodoucts'][index]['name'].toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                            Container(
                                              height: 100,
                                              width: 220,
                                              // padding: const EdgeInsets.all(13.0),
                                              child: Text(
                                                snapshot.data!['prodouct_type']['prodoucts'][index]['discrpition'],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey),
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
                                      );
                                    }),
                              ],
                            ),
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
                          return const Center(
                            child: Text('Own Code Error'),
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
            : null);
  }
}
