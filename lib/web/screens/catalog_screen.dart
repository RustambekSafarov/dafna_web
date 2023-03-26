// ignore_for_file: prefer_const_constructors

import 'package:dafna_web/web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';
import '../widget/appbar_view.dart';

class CatalogScreen extends StatelessWidget with ChangeNotifier {
  CatalogScreen({super.key});
  static const routeName = '/catalog';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryColor,
        title: AppBarView(),
        toolbarHeight: 122,
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
                    itemCount: snapshot.data!.toList().length,
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
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Center(
                    child: Text('You have not internet!'),
                  );
                } else {
                  throw Exception('Own code error');
                }
              },
            ),
            // Spacer(),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.blue,
              // width: double.infinity,
              height: 320,
              child: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
