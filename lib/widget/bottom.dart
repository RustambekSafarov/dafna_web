import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Xaridorlar'),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Buyurtmani qanday\nqilish kerak')),
                  TextButton(
                    onPressed: () {},
                    child: const Text('To\'lov usuli '),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Sotib olish qaytariladi ')),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Ko\'p so\'raladigan savollar'))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hamkorlar'),
                  TextButton(onPressed: () {}, child: const Text('Afzalliklar'))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kompaniya'),
                  TextButton(onPressed: () {}, child: const Text('Kontaktlar')),
                  TextButton(onPressed: () {}, child: const Text('Ishlar'))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Biz ijtimoiy\ntarmoqlardamiz'),
                  TextButton(onPressed: () {}, child: const Text('Telegram')),
                  TextButton(onPressed: () {}, child: const Text('Instagram')),
                  TextButton(onPressed: () {}, child: const Text('Facebook'))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kontaktlar'),
                  const Text('Olmazor tumani, st. Jomiy, 5.'),
                  const Text('Kundalik: 09:00-18:00'),
                  Row(
                    children: [
                      const Text('Telefon:'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('+998 71 203 11 11'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
