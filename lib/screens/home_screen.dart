// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dafna_web/widget/drawer_view.dart';
import 'package:dafna_web/widget/overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../widget/appbar_view.dart';
import '../widget/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? AppBar(
              backgroundColor: Color(0xFF778beb),
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 40),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  height: 45,
                  child: TextField(
                    onSubmitted: (value) {
                      context.goNamed('/search-result', extra: value);
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Men ...ni qidirayabman',

                      // focusColor: Colors.white30,
                      hintStyle: const TextStyle(
                        // height: 50,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                      filled: true,
                      // focusColor: const Color.fromARGB(255, 5, 52, 80),
                      fillColor: const Color(0xFF70a1ff),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),
              title: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      child: Image.network(
                        'https://telegra.ph/file/dc9cba1fd9f3f1b63d1d0.png',
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
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.goNamed('/shopping-cart');
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
              toolbarHeight: 60,
            )
          : AppBar(
              backgroundColor: Colors.cyan.shade600,
              title: const AppBarView(),
              toolbarHeight: 120,
            ),
      drawer: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? Drawer(
              child: MainDrawer(),
            )
          : null,
      body: OverView(),
      bottomNavigationBar: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? BottomAppBar(
              color: Color(0xFF778beb),
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
          : kIsWeb
              ? null
              : null,
    );
  }
}
