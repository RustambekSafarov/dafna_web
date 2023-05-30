import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsM extends StatelessWidget {
  const SponsorsM({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
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
                width: 190,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage('https://mebel.dafna.uz/img/Today/eman-banner.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
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
                width: 190,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage('https://mebel.dafna.uz/img/Today/aiko-banner.jpg'),
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
