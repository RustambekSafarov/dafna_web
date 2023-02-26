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
          Image.network('https://telegra.ph/file/8dd96f0e60c3d5666f34b.png'),
          Image.network('https://telegra.ph/file/cfc8883b6b59c0d9703e2.png'),
          Image.network('https://telegra.ph/file/1b07ec9f71d30ae2657c0.png'),
          Image.network('https://telegra.ph/file/2d61a29ac667bde3c9832.png'),
          Image.network('https://telegra.ph/file/462fd514fff89df452622.png'),
          Image.network('https://telegra.ph/file/a24de02c012207b89fe58.png'),
          Image.network('https://telegra.ph/file/35b6c02129a77b32dffee.png'),
        ],
      ),
    );
  }
}
