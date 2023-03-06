// ignore_for_file: avoid_unnecessary_containers

import 'package:dafna_web/models/practick.dart';
import 'package:dafna_web/widget/ideas_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import '../service/get_service.dart';
import '../widget/footer.dart';
import '../widget/new_products.dart';
import '../widget/recommended.dart';
import '../widget/sponsors.dart';

class OverView extends StatefulWidget {
  int? iD;
  OverView({super.key});
  late final GoRouter router;

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getCatalog(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.network(
                            'https://telegra.ph/file/9a476a924652ca1edfd9a.jpg'),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 100,
                            child: Divider(
                                color: Colors.orangeAccent, thickness: 5),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      // IntroPage()
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 55, right: 55),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (context, index) => InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          context.goNamed('/catalog-detail',
                              extra: snapshot.data![index]['id']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              snapshot.data![index]['img_url'],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(left: 100, top: 40, bottom: 40),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Yangi',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: NewProducts(),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(left: 100, top: 40, bottom: 40),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Tavsiyalar',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Recommendations(),
                ),
                const SliverToBoxAdapter(
                  child: Sponsors(),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 55, right: 55, bottom: 55),
                  sliver: SliverGrid.builder(
                    itemCount: forGrid.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => SizedBox(
                      height: 150,
                      width: 280,
                      child: Image.network(
                        forGrid[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.topCenter,
                    color: Colors.blue,
                    width: double.infinity,
                    height: 320,
                    child: const Footer(),
                  ),
                )
              ],
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
    );
  }
}
