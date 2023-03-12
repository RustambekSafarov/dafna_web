import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: Padding(
        padding: EdgeInsets.only(
            top: defaultTargetPlatform == TargetPlatform.android ? 20 : 50,
            bottom: defaultTargetPlatform == TargetPlatform.android ? 20 : 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Link(
              target: LinkTarget.defaultTarget,
              uri: Uri.parse('https://eman.uz/'),
              builder: (context, followLink) => InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: followLink,
                child: Container(
                  width: defaultTargetPlatform == TargetPlatform.android
                      ? 200
                      : 500,
                  height: defaultTargetPlatform == TargetPlatform.android
                      ? 130
                      : 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          'https://mebel.dafna.uz/img/Today/eman-banner.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: defaultTargetPlatform == TargetPlatform.android ? 5 : 90,
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () async {
                const url = 'https://aiko.uz/';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                width:
                    defaultTargetPlatform == TargetPlatform.android ? 200 : 500,
                height:
                    defaultTargetPlatform == TargetPlatform.android ? 130 : 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        'https://mebel.dafna.uz/img/Today/aiko-banner.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
