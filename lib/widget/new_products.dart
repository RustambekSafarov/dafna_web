// ignore_for_file: prefer_const_declarations, avoid_unnecessary_containers

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dafna_web/service/dafna_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewProducts extends StatefulWidget {
  static const routeName = '/productPage';

  static final String id = 'introPage';
  const NewProducts({super.key});

  @override
  State<NewProducts> createState() => _IntroPageState();
}

class _IntroPageState extends State<NewProducts> {
  final controller = PageController();
  int activeIndex = 0;

  void _onDotClicked(int index) {
    // Move to the clicked dot's page
    controller.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNewproduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index, realIndex) {
                    int id = snapshot.data![index]['id'];
                    return InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/product-detail',
                            arguments: {'id': id});
                      },
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: 210,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                      snapshot.data![index]['img_url'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            // height: 55,
                            width: 220,
                            bottom: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    snapshot.data![index]['name'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${snapshot.data![index]['price']} so`m',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  // carouselController: ,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    disableCenter: true,
                    viewportFraction: 0.2,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SmoothPageIndicator(
                controller: PageController(
                  viewportFraction: 0.1,
                  initialPage: activeIndex,
                ),
                onDotClicked: (i) {
                  _onDotClicked(i);
                },
                count: snapshot.data!.length,
                effect: const WormEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Color.fromARGB(255, 143, 210, 255),
                  dotHeight: 7,
                  dotWidth: 100,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
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
          throw Exception('Error a');
        }
      },
    );
  }
}
