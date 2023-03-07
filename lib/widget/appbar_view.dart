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
    return Center(
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => context.goNamed('/home'),
                  child: const Text(
                    'Asosiy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () => context.goNamed('/catalog'),
                  child: const Text(
                    'Katalog',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () => context.goNamed('/video-view'),
                  child: const Text(
                    'Video sharhlar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
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
                const SizedBox(width: 15),
                TextButton(
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
                const SizedBox(width: 15),
                Link(
                  uri: Uri.parse('https://telegram.me/Dafna_mebel_bot'),
                  builder: (context, followLink) => TextButton(
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
                const SizedBox(width: 15),
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 100,
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
                const SizedBox(width: 100),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '+998(71)203-11-11',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                  width: 120,
                  height: 80,
                  child:
                      // Image(
                      //   image: NetworkImage('https://mebel.dafna.uz/img/logo.png'),
                      // ),
                      Image.network('https://mebel.dafna.uz/img/logo.png'),
                ),
                IconButton(
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
                SizedBox(
                  width: 600,
                  height: 35,
                  child: TextField(
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
