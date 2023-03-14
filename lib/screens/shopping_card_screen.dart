import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../models/colors.dart';
import '../widget/appbar_view.dart';
import '../widget/drawer_view.dart';

class ShoppingCardScreen extends StatelessWidget {
  ShoppingCardScreen({super.key});
  static const routeName = '/shopping-cart';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? Drawer(
              child: MainDrawer(),
            )
          : null,
      appBar: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? AppBar(
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
                      fillColor: const Color(0xFF4bbedd),
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
              backgroundColor: primaryColor,
              toolbarHeight: 122,
              title: AppBarView(),
            ),
      bottomNavigationBar: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? BottomAppBar(
              color: Colors.blue,
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
