import 'dart:io';

import 'package:dafna_web/web/models/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  sponsor1 = false;
                });
              },
              onExit: (event) {
                setState(() {
                  sponsor1 = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 9555),
                width: 500,
                height: 300,
                child: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () async {
                    const url = 'https://eman.uz/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: sponsor1 == false
                            ? BoxFit.fitHeight
                            : BoxFit.fitWidth,
                        image: NetworkImage(
                            'https://mebel.dafna.uz/img/Today/eman-banner.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 90,
            ),
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  sponsor2 = false;
                });
              },
              onExit: (event) {
                setState(() {
                  sponsor2 = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 9555),
                width: 500,
                height: 300,
                child: InkWell(
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: sponsor2 == false
                            ? BoxFit.fitHeight
                            : BoxFit.fitWidth,
                        image: const NetworkImage(
                            'https://mebel.dafna.uz/img/Today/aiko-banner.jpg'),
                      ),
                    ),
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
