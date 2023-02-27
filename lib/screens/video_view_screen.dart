// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:dafna_web/service/dafna_api.dart';
import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoViewScreen extends StatefulWidget {
  VideoViewScreen({super.key});
  static const routeName = '/video-view';

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();

  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),

      // body: FutureBuilder(
      //   future: getVideo(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return GridView.builder(
      //           itemCount: snapshot.data!.length,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2),
      //           itemBuilder: (context, index) {
      //             final _controller = YoutubePlayerController.fromVideoId(
      //               videoId: snapshot.data![index]['video_url'].substring(18),
      //               autoPlay: false,
      //               params:
      //                   const YoutubePlayerParams(showFullscreenButton: true),
      //             );
      //             return Column(
      //               children: [
      //                 YoutubePlayer(
      //                   controller: _controller,
      //                   aspectRatio: 16 / 9,
      //                 ),
      //               ],
      //             );
      //           });
      //     } else if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: SpinKitThreeBounce(
      //           size: 30,
      //           color: Colors.black,
      //         ),
      //       );
      //     } else {
      //       return Text('Error');
      //     }
      //   },
      // ),

      body: FutureBuilder(
        future: getVideo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final _controller = YoutubePlayerController.fromVideoId(
                    videoId: snapshot.data![index]['video_url'].substring(18),
                    autoPlay: false,
                    params:
                        const YoutubePlayerParams(showFullscreenButton: true),
                  );
                  return Column(
                    children: [
                      YoutubePlayer(
                        controller: _controller,
                        aspectRatio: 16 / 9,
                      ),
                    ],
                  );
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitThreeBounce(
                size: 30,
                color: Colors.black,
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
