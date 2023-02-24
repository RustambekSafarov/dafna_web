import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 22,
          ),
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
                      child: const Text(
                        'Buyurtmani qanday\nqilish kerak',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'To\'lov usuli ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sotib olish qaytariladi ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ko\'p so\'raladigan savollar',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hamkorlar'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Afzalliklar',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kompaniya'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Kontaktlar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ishlar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Biz ijtimoiy\ntarmoqlardamiz'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Telegram',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Instagram',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              FittedBox(
                child: Column(
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
                          child: const Text(
                            '+998 71 203 11 11',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
