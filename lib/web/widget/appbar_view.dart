import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';
import '../../mobile/theme/theme_manager.dart';
import '../models/constants.dart';
import 'drawer_view.dart';

class AppBarView extends StatefulWidget {
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _MyWidgetState();
}

ThemeManager _themeManager = ThemeManager();

class _MyWidgetState extends State<AppBarView> {
  final TextEditingController _controller = TextEditingController();

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
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    asosiy = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    asosiy = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.06,
                  child: TextButton(
                    onPressed: () => context.goNamed('/home'),
                    child: Text(
                      'Asosiy',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: asosiy == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    katalog = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    katalog = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.07,
                  child: TextButton(
                    onPressed: () => context.goNamed('/catalog'),
                    child: Text(
                      'Katalog',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: katalog == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    video = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    video = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.09,
                  child: TextButton(
                    onPressed: () => context.goNamed('/video-view'),
                    child: Text(
                      'Video sharhlar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: video == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    kontakt = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    kontakt = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.075,
                  child: TextButton(
                    onPressed: () {
                      context.goNamed('/contact');
                    },
                    child: Text(
                      'Kontaktlar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: kontakt == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    bandlik = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    bandlik = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.075,
                  child: TextButton(
                    onPressed: () {
                      context.goNamed('/employment');
                    },
                    child: Text(
                      'Bandlik',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: bandlik == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    fikr = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    fikr = true;
                  });
                },
                child: Link(
                  uri: Uri.parse('https://telegram.me/Dafna_mebel_bot'),
                  builder: (context, followLink) => SizedBox(
                    width: constraints.maxWidth * 0.09,
                    child: TextButton(
                      onPressed: followLink,
                      child: Text(
                        'Fikr Qoldiring',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          decoration: fikr == false
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: Colors.white,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(width: 15),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    chegirma = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    chegirma = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: constraints.maxWidth * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Text(
                    'Chegirmalar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      decoration: chegirma == false
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(width: constraints.maxWidth * 0.05),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isDark = !isDark;
                      _themeManager.toogleTheme(isDark);
                    },
                  );
                },
                child: Icon(isDark ? Icons.sunny : Icons.dark_mode),
              ),
              SizedBox(width: constraints.maxWidth * 0.05),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    number = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    number = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.2,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '+7 (495) 120 75 59',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: number == false
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 3,
                      ),
                    ),
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
                    hoverColor: ThemeData().unselectedWidgetColor.withAlpha(30),
                    // focusColor: const Color.fromARGB(255, 5, 52, 80),
                    fillColor: Theme.of(context).primaryColorLight,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.02,
              ),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    adress = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    adress = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.06,
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: adress == false ? 25 : 20,
                        ),
                        Text(
                          'Manzillar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: adress == false ? 16 : 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    register = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    register = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.08,
                  child: InkWell(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: register == false ? 25 : 20,
                        ),
                        Text(
                          'Ro\'yxatdan\no\'tish ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: register == false ? 16 : 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    shop = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    shop = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.06,
                  child: InkWell(
                    onTap: () {
                      context.goNamed('/shopping-cart');
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: shop == false ? 25 : 20,
                        ),
                        Text(
                          'Savat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: shop == false ? 16 : 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    favorite = false;
                  });
                },
                onExit: (event) {
                  setState(() {
                    favorite = true;
                  });
                },
                child: SizedBox(
                  width: constraints.maxWidth * 0.06,
                  child: InkWell(
                    onTap: () {
                      context.goNamed('/favorites');
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: favorite == false ? 25 : 20,
                        ),
                        Text(
                          'Sevimlilar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: favorite == false ? 16 : 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
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
