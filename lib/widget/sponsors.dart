import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              width: 500,
              height: 330,
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
            width: 500,
            height: 330,
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
    );
  }
}
