import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/get_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recommendations extends StatefulWidget with ChangeNotifier {
  static const routeName = '/productPage';

  static final String id = 'introPage';
  Recommendations({super.key});

  @override
  State<Recommendations> createState() => _IntroPageState();
}

class _IntroPageState extends State<Recommendations> {
  @override
  // ignore: override_on_non_overriding_member
  final PageController _controller = PageController();
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
      future: getRecommendation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(200),
                // ),
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
                        context.goNamed('/product-info', extra: id);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: defaultTargetPlatform ==
                                            TargetPlatform.android ||
                                        defaultTargetPlatform ==
                                            TargetPlatform.iOS
                                    ? 120
                                    : 210,
                                height: defaultTargetPlatform ==
                                            TargetPlatform.android ||
                                        defaultTargetPlatform ==
                                            TargetPlatform.iOS
                                    ? 120
                                    : 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                      'https://ogabek007.pythonanywhere.com/' +
                                          snapshot.data![index]['img_url'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: Text(
                                  snapshot.data![index]['name'].toUpperCase(),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
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
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    height: defaultTargetPlatform == TargetPlatform.android ||
                            defaultTargetPlatform == TargetPlatform.iOS
                        ? 240
                        : 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    disableCenter: true,
                    viewportFraction:
                        defaultTargetPlatform == TargetPlatform.android ||
                                defaultTargetPlatform == TargetPlatform.iOS
                            ? 0.9
                            : 0.2,
                  ),
                ),
              ),
              const SizedBox(
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
                effect: WormEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Color.fromARGB(255, 143, 210, 255),
                  dotHeight: 7,
                  dotWidth: defaultTargetPlatform == TargetPlatform.android ||
                          defaultTargetPlatform == TargetPlatform.iOS
                      ? 30
                      : 100,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
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
          throw Exception('Network Error');
        }
      },
    );
  }
}
