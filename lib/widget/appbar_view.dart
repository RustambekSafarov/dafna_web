import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';
import 'drawer_view.dart';

class AppBarView extends StatefulWidget {
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AppBarView> {
  final TextEditingController _controller = TextEditingController();
  bool menu = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: [
          const SizedBox(height: 12),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: constraints.maxWidth * 0.07),
              SizedBox(
                width: constraints.maxWidth * 0.06,
                child: TextButton(
                  onPressed: () => context.goNamed('/home'),
                  child: const Text(
                    'Asosiy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              SizedBox(
                width: constraints.maxWidth * 0.07,
                child: TextButton(
                  onPressed: () => context.goNamed('/catalog'),
                  child: const Text(
                    'Katalog',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              SizedBox(
                width: constraints.maxWidth * 0.09,
                child: TextButton(
                  onPressed: () => context.goNamed('/video-view'),
                  child: const Text(
                    'Video sharhlar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              SizedBox(
                width: constraints.maxWidth * 0.075,
                child: TextButton(
                  onPressed: () {
                    context.goNamed('/contact');
                  },
                  child: const Text(
                    'Kontaktlar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              SizedBox(
                width: constraints.maxWidth * 0.075,
                child: TextButton(
                  onPressed: () {
                    context.goNamed('/employment');
                  },
                  child: const Text(
                    'Bandlik',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              Link(
                uri: Uri.parse('https://telegram.me/Dafna_mebel_bot'),
                builder: (context, followLink) => SizedBox(
                  width: constraints.maxWidth * 0.09,
                  child: TextButton(
                    onPressed: followLink,
                    child: const Text(
                      'Fikr Qoldiring',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: constraints.maxWidth * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: const Text(
                  'Chegirmalar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(width: constraints.maxWidth * 0.1),
              SizedBox(
                width: constraints.maxWidth * 0.2,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '+7 (495) 120 75 59',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.05,
              ),
              SizedBox(
                width: constraints.maxWidth * 0.11,
                height: 80,
                child:
                    // Image(
                    //   image: NetworkImage('https://mebel.dafna.uz/img/logo.png'),
                    // ),
                    Image.network(
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
              SizedBox(
                width: constraints.maxWidth * 0.05,
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              alignment: Alignment.bottomCenter,
                              insetPadding: EdgeInsets.all(0),
                              backgroundColor: Colors.lightBlue,
                              content: Row(
                                children: [
                                  MainDrawer(),
                                  MainDrawerIn(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.5,
                height: 35,
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
              SizedBox(
                width: constraints.maxWidth * 0.04,
              ),
              SizedBox(
                width: constraints.maxWidth * 0.06,
                child: InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Manzillar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              SizedBox(
                width: constraints.maxWidth * 0.06,
                child: InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Ro\'yxatdan\no\'tish ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              SizedBox(
                width: constraints.maxWidth * 0.06,
                child: InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Savat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              SizedBox(
                width: constraints.maxWidth * 0.06,
                child: InkWell(
                  onTap: () {
                    context.goNamed('/favorites');
                  },
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        'Sevimlilar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
