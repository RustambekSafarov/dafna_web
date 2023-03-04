// ignore_for_file: prefer_const_constructors

import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

import '../service/get_service.dart';
import '../widget/appbar_view.dart';

class Contactcreen extends StatefulWidget {
  const Contactcreen({super.key});
  static const routeName = '/contact';

  @override
  State<Contactcreen> createState() => _ContactcreenState();
}

class _ContactcreenState extends State<Contactcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarView(),
        toolbarHeight: 122,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: InkWell(
                    onTap: () {
                      context.goNamed('/home');
                    },
                    child: Text(
                      'Asosiy /',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  ' Kontaktlar',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: Divider(),
          ),
          FutureBuilder(
            future: getMainContact(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                            'https://telegra.ph/file/1fd2ef08e9092188110fa.png'),
                        // cont.value.isInitialized
                        //     ? AspectRatio(
                        //         aspectRatio: cont.value.aspectRatio,
                        //         child: VideoPlayer(cont),
                        //       )
                        //     : Container(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kontaktlar',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Operator raqamlari:',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data![0]['operator']),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Mebel Menejeri',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data![0]['mebel_menejer']),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Kafolat va qaytarib berish uchun:',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data![0]['menejer']),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Elektron manzil:',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data![0]['email']),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Kanallarimizga obuna bo\'ling:',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Link(
                                    uri: Uri.parse(
                                        'https://www.facebook.com/dafnamebel/'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/46b1589031275afecbc5e.png'),
                                      );
                                    }),
                                Link(
                                    uri: Uri.parse(
                                        'https://www.instagram.com/dafnamebel/'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/701dcc97ab483734ff98c.png'),
                                      );
                                    }),
                                Link(
                                    uri: Uri.parse('https://t.me/dafnaonline'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/a36351659846f5d4363a6.png'),
                                      );
                                    }),
                                Link(
                                    uri: Uri.parse(
                                        'https://www.tiktok.com/@dafnamebel'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/bfb655d6bb47f0337bd1f.png'),
                                      );
                                    }),
                                Link(
                                    uri: Uri.parse(
                                        'https://www.youtube.com/@dafnamebel5303'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/841b9e60dee57438a9fd0.png'),
                                      );
                                    }),
                                Link(
                                    uri: Uri.parse(
                                        'https://www.pinterest.com/Dafnamebel/'),
                                    builder: (context, followLink) {
                                      return InkWell(
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: followLink,
                                        child: Image.network(
                                            'https://telegra.ph/file/07019c815a5df8c65a1a2.png'),
                                      );
                                    }),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 65, top: 25, bottom: 25),
                          child: Text(
                            'Filiallarning joylashuvi',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FutureBuilder(
                          future: getContact(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                flex: 1,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data![index]
                                                  ['branches_name'],
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            width: 300,
                                            child: Text(
                                              snapshot.data![index]['address']
                                                  .toString(),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Menejer:  ${snapshot.data![index]['menefer']}',
                                            ),
                                          ),
                                          // Text(
                                          //   snapshot.data![index]['main_contacts']
                                          //       .toString(),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center();
                            } else {
                              return const Text('Error');
                            }
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 165),
                          height: 65,
                          width: 350,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35))),
                            child: Text(
                              'U YERGA QANDAY BORISH MUMKIN',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
                // return
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitHourGlass(
                    size: 30,
                    color: Colors.black,
                  ),
                );
              } else {
                throw Exception('Error');
              }
            },
          ),
          // const Positioned(
          //   bottom: 1,
          //   child:
          // Footer(),
          // ),
        ],
      ),
    );
  }
}
