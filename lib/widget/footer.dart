import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/link.dart';

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
                  children: [
                    const Text(
                      'Xaridorlar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/buyurtma');
                      },
                      child: const Text(
                        'Buyurtma berish usuli',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/tolov');
                      },
                      child: const Text(
                        'To\'lov usuli',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/sotib-olish');
                      },
                      child: const Text(
                        'Sotib olish qaytariladi ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/savollar');
                      },
                      child: const Text(
                        'Ko\'p so\'raladigan savol',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hamkorlar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/afzalliklar');
                      },
                      child: const Text(
                        'Avzalliklar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kompaniya',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        // fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/contact');
                      },
                      child: const Text(
                        'Kontaktlar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/employment');
                      },
                      child: const Text(
                        'Ishlar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ijtimoiy Tarmoqlarimiz',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        // fontWeight: FontWeight.w200,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 15),
                    Link(
                        uri: Uri.parse('https://t.me/Dafnamebel'),
                        builder: (context, followLink) {
                          return InkWell(
                            onTap: followLink,
                            child: const Text(
                              'Telegram',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 10),
                    Link(
                        uri: Uri.parse('https://www.instagram.com/dafnamebel'),
                        builder: (context, followLink) {
                          return InkWell(
                            onTap: followLink,
                            child: const Text(
                              'Instagram',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          );
                        }),
                    SizedBox(height: 10),
                    Link(
                        uri: Uri.parse('https://www.facebook.com/dafnamebel'),
                        builder: (context, followLink) {
                          return InkWell(
                            onTap: followLink,
                            child: const Text(
                              'FaceBook',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          );
                        }),
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
