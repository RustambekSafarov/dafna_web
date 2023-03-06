// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:dafna_web/service/get_service.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class VideoViewScreen extends StatefulWidget {
  VideoViewScreen({super.key});
  static const routeName = '/video-view';

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  List img = [
    'https://telegra.ph/file/76aea3ef9449a82e1b869.jpg',
    'https://telegra.ph/file/a7a63c822aa910e3b2947.jpg',
    'https://telegra.ph/file/7874e010dbf3c25c7e50e.jpg',
    'https://telegra.ph/file/ddb602100e63360b2503c.jpg',
    'https://telegra.ph/file/9477fbefed2832a62d977.jpg',
    'https://telegra.ph/file/009ac15e25e62253bdd60.jpg',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: AppBarView(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loyihalar bo\'yicha video sharhlar',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: getVideo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 1),
                      itemBuilder: (context, index) => Link(
                          uri: Uri.parse(snapshot.data![index]['video_url']),
                          builder: (context, followLink) {
                            return Column(
                              children: [
                                Text(
                                  snapshot.data![index]['name'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    shadows: [
                                      const Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 20,
                                        color:
                                            Color.fromARGB(255, 49, 224, 255),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: followLink,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(55)),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.network(img[index]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 65, right: 65),
                                  child: Text(
                                    snapshot.data![index]['discrpition'],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      shadows: [
                                        const Shadow(
                                          offset: Offset(0, 0),
                                          blurRadius: 20,
                                          color:
                                              Color.fromARGB(255, 49, 224, 255),
                                        ),
                                      ],
                                      // backgroundColor: Color(0xFFb9e9fa),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitHourGlass(
                      size: 30,
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Text('Own Code Error');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
