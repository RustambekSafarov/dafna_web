import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Xaridorlar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Buyurtma berish usuli',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'To\'lov usuli',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sotib olish qaytariladi ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ko\'p so\'raladigan savol',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hamkorlar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Avzalliklar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Kompaniya',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        // fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Kontaktlar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ishlar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ijtimoiy Tarmoqlarimiz',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        // fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Telegram',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Instagram',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'FaceBook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Kontaktlar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Olmazor tumani ,st. Jomiy,5.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kundalik: 09:00-18:00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Telifon: +998(71)203-11-11',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 150,
                ),
              ],
            ),
          ),
          const Text(
            '1995-2023 © mebel.dafna.uz — mebel va aksessuarlar onlayn-do\'koni.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),
          ),
          const Text(
            'Barcha huquqlar himoyalangan.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 595),
            child: Row(
              children: [
                SizedBox(
                    height: 18,
                    width: 50,
                    child: Image.network(
                        'https://mebel.dafna.uz/img/social/2.png')),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 18,
                    width: 50,
                    child: Image.network(
                        'https://mebel.dafna.uz/img/social/4.png')),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 18,
                    width: 50,
                    child: Image.network(
                        'https://mebel.dafna.uz/img/social/5.png')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
