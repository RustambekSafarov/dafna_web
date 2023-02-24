// ignore_for_file: prefer_const_declarations, avoid_unnecessary_containers

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dafna_web/service/dafna_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Recommendations extends StatefulWidget {
  static const routeName = '/productPage';

  static final String id = 'introPage';
  const Recommendations({super.key});

  @override
  State<Recommendations> createState() => _IntroPageState();
}

class _IntroPageState extends State<Recommendations> {
  @override
  // ignore: override_on_non_overriding_member
  final PageController _controller = PageController();
  dynamic _currentPage = 0;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceIn,
        );
      }
    });
    super.initState();
  }

  bool g = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRecommendation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(200),
            // ),
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index, realIndex) {
                return Stack(
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
                      // child: Image.network(
                      //   snapshot.data![index]['img_url'],
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Positioned(
                      // height: 55,
                      width: 220,
                      bottom: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Text(
                              snapshot.data![index]['name'],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${snapshot.data![index]['price']} so`m',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                disableCenter: true,
                viewportFraction: 0.2,
              ),
            ),
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
