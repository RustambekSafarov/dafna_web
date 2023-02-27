import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final styleButton = const TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
  final styleText = const TextStyle(
    fontSize: 10,
    // fontWeight: FontWeight.w300,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      width: double.infinity,
      child: FittedBox(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 22,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Xaridorlar', style: styleText),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Buyurtmani qanday\nqilish kerak',
                          style: styleButton,
                        )),
                    TextButton(
                      onPressed: () {},
                      child: Text('To\'lov usuli ', style: styleButton),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:
                          Text('Sotib olish qaytariladi ', style: styleButton),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Ko\'p so\'raladigan savollar',
                          style: styleButton),
                    )
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hamkorlar', style: styleText),
                    TextButton(
                      onPressed: () {},
                      child: Text('Afzalliklar', style: styleButton),
                    )
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kompaniya', style: styleText),
                    TextButton(
                      onPressed: () {},
                      child: Text('Kontaktlar', style: styleButton),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Ishlar', style: styleButton),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Biz ijtimoiy\ntarmoqlardamiz', style: styleText),
                    TextButton(
                      onPressed: () {},
                      child: Text('Telegram', style: styleButton),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Instagram', style: styleButton),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Facebook', style: styleButton),
                    )
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kontaktlar', style: styleText),
                    Text('Olmazor tumani, st. Jomiy, 5.', style: styleText),
                    Text('Kundalik: 09:00-18:00', style: styleText),
                    Row(
                      children: [
                        const Text(
                          'Telefon:',
                          style: TextStyle(
                            fontSize: 7,
                            // fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('+998 71 203 11 11', style: styleButton),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Text(
              '1995-2023 © mebel.dafna.uz — mebel va aksessuarlar onlayn-do\'koni.',
              style: styleButton,
            ),
            Text(
              'Barcha huquqlar himoyalangan.',
              style: styleButton,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SizedBox(
                      height: 8,
                      child: Image.network(
                          'https://mebel.dafna.uz/img/social/2.png')),
                  SizedBox(
                      height: 8,
                      child: Image.network(
                          'https://mebel.dafna.uz/img/social/4.png')),
                  SizedBox(
                      height: 8,
                      child: Image.network(
                          'https://mebel.dafna.uz/img/social/5.png')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
