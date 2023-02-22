import 'dart:async';

import 'package:dafna_web/service/dafna_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProdouctPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final String id = 'introPage';
  const ProdouctPage({super.key});

  @override
  State<ProdouctPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<ProdouctPage> {
  @override
  // ignore: override_on_non_overriding_member
  final PageController _controller = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
    super.initState();
  }

  bool g = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FutureBuilder(
              future: getnewprodouct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      onPageChanged: (value) {
                        _currentPage = value;
                      },
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          Image.network(snapshot.data![index]['img_url']));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndictor(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indictor(bool isActive) {
    return AnimatedContainer(
      height: isActive ? 10 : 6,
      width: isActive ? 50 : 50,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  List<Widget> _buildIndictor() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (_currentPage == i) {
        indicators.add(_indictor(true));
      } else {
        indicators.add(_indictor(false));
      }
    }
    return indicators;
  }
}
