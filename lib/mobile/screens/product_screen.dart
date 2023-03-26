import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';

class ProductScreenM extends StatefulWidget {
  int? productTypeId;
  int? productId;
  String? productTypeName;
  ProductScreenM({
    super.key,
    required this.productId,
    required this.productTypeId,
    required this.productTypeName,
  });
  static const routeName = '/product';

  @override
  State<ProductScreenM> createState() => _ProductScreenMState();
}

class _ProductScreenMState extends State<ProductScreenM> {
  int number = 0;
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prodoucts'),
        leading: InkWell(
            onTap: () {
              context.goNamed('/home');
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: ListView(
          children: [
            FutureBuilder(
              future: getProducts(widget.productTypeId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  id = widget.productTypeId!;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saralash turi:'),
                        Row(
                          children: [
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot
                              .data!['prodouct_type']['prodoucts'].length,
                          itemBuilder: (context, index) {
                            widget.productTypeId =
                                snapshot.data!['prodouct_type']['prodoucts']
                                    [index]['id'];

                            return InkWell(
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                context.goNamed('/product-detail',
                                    extra: widget.productTypeId);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      height: 220,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.favorite_border),
                                          ),
                                          SizedBox(
                                            width: 220,
                                            height: 150,
                                            child: Image.network(
                                              'https://ogabek007.pythonanywhere.com/' +
                                                  snapshot.data![
                                                              'prodouct_type']
                                                          ['prodoucts'][index]
                                                      ['img_url'],
                                              // fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Image.network(
                                                  'https://telegra.ph/file/a775320534f348ae7f531.png',
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Text(
                                      snapshot.data!['prodouct_type']
                                              ['prodoucts'][index]['name']
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
                                      snapshot.data!['prodouct_type']
                                          ['prodoucts'][index]['discrpition'],
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
                          },
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
          ],
        ),
      ),
    );
  }
}
