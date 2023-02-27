import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';

class Employment extends StatelessWidget {
  const Employment({super.key});
  static const routeName = '/employment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 70, top: 20),
            child: Text(
              'Bandlik',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 65, right: 65, top: 25, bottom: 25),
            child: Image.network(
                'https://telegra.ph/file/c50c369ffa0cba19ca2e6.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65),
            child: Row(
              children: [
                const Text(
                  'HR menejeriga: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: const Text(
                    '+998998087828 murojaat qiling',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 65, top: 65, bottom: 65),
            child: Text(
              'Faol vakansiyalar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Image.network('https://telegra.ph/file/229f7c3e7a8a41495f66a.jpg'),
          Image.network('https://telegra.ph/file/5d195620e2438249146a1.jpg'),
          Image.network('https://telegra.ph/file/39b0bcdd8b452ef4a3575.jpg'),
          Image.network('https://telegra.ph/file/1f67ef7b1cf6520cb2878.jpg'),
          Image.network('https://telegra.ph/file/20967f4046332701bff76.jpg'),
          Image.network('https://telegra.ph/file/9d879dde52bc61ed894ee.jpg'),
        ],
      ),
    );
  }
}
