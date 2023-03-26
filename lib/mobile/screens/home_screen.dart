// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dafna_web/mobile/widgets/catalog.dart';
import 'package:dafna_web/mobile/widgets/favorite.dart';
import 'package:dafna_web/mobile/widgets/home.dart';
import 'package:dafna_web/mobile/widgets/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../theme/theme_manager.dart';
import '../widgets/drawer_view.dart';

class HomeScreenM extends StatefulWidget with ChangeNotifier {
  HomeScreenM({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreenM> createState() => _HomeScreenMState();
}

ThemeManager _themeManager = ThemeManager();

class _HomeScreenMState extends State<HomeScreenM> {
  final TextEditingController _controller = TextEditingController();
  List<Widget> pages = [
    HomeWidget(),
    CatalogWidget(),
    ShoppingWidget(),
    FavoriteWidget(),
  ];
  bool isDark = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(contex   t).primaryColor,
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
                fillColor: Theme.of(context).primaryColorLight,
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
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              setState(() {
                isDark = !isDark;
                _themeManager.toogleTheme(isDark);
              });
            },
            child: Icon(isDark ? Icons.sunny : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                i = 2;
              });
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        toolbarHeight: 60,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            i = value;
          });
        },
        currentIndex: i,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.transparent,
            label: 'Home',
            icon: Icon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(
              FontAwesomeIcons.barsStaggered,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Shopping',
            icon: Icon(
              FontAwesomeIcons.basketShopping,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(
              FontAwesomeIcons.heartCircleCheck,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
