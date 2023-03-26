// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/get_service.dart';

class CatalogDetailScreenM extends StatefulWidget {
  int? catalogId;
  CatalogDetailScreenM({super.key, required this.catalogId});
  static const routeName = '/catalog-detail';

  @override
  State<CatalogDetailScreenM> createState() => _CatalogDetailScreenMState();
}

class _CatalogDetailScreenMState extends State<CatalogDetailScreenM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prodouct types'),
        leading: InkWell(
            onTap: () {
              context.goNamed('/home');
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: getCatalogType(widget.catalogId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 15,
                        bottom: 40,
                      ),
                      child: Text(
                        snapshot.data!['discrpition'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!['prodouct_typt'].length,
                      itemBuilder: (context, index) {
                        final productTypeId =
                            snapshot.data!['prodouct_typt'][index]['id'];

                        final productId = snapshot.data!['id'];
                        final productTypeName =
                            snapshot.data!['prodouct_typt'][index]['name'];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            context.goNamed('/product', extra: [
                              productTypeId,
                              productId,
                              productTypeName
                            ]);
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  width: 200,
                                  height: 150,
                                  child: Image.network(
                                    'https://ogabek007.pythonanywhere.com/' +
                                        snapshot.data!['prodouct_typt'][index]
                                            ['img_url'],
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
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                snapshot.data!['prodouct_typt'][index]['name']
                                    .toUpperCase(),
                                style: GoogleFonts.poppins(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
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
