// ignore_for_file: avoid_unnecessary_containers

import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:dafna_web/widget/new_products.dart';
import 'package:dafna_web/widget/recommended.dart';
import 'package:dafna_web/widget/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

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
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Image.network(
                        'https://mebel.dafna.uz/uploads/sliders/s_1672982886.jpg'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 100,
                          child:
                              Divider(color: Colors.orangeAccent, thickness: 5),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) => InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {},
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
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: NewProducts(),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(left: 75, right: 75, top: 20),
                sliver: SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.lightBlue,
                    thickness: 5,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(left: 100, top: 40, bottom: 40),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Tavsiyalar',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Recommendations(),
              ),
              const SliverPadding(
                padding:
                    EdgeInsets.only(left: 75, right: 75, top: 20, bottom: 100),
                sliver: SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.lightBlue,
                    thickness: 5,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Sponsors(),
              ),
              SliverToBoxAdapter(
                child: Footer(),
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitThreeBounce(
              size: 30,
              color: Colors.black,
            ),
          );
        } else {
          return const Text('Error');
        }
      },
    ));
  }
}
