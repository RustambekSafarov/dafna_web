import 'dart:io';

import 'package:dafna_web/models/practick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IdeasPhotos extends StatelessWidget {
  const IdeasPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: defaultTargetPlatform == TargetPlatform.android
          ? forGrid.length ~/ 4
          : forGrid.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: defaultTargetPlatform == TargetPlatform.android ? 2 : 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => Image.network(
        forGrid[index],
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Placeholder();
        },
      ),
    );
  }
}
