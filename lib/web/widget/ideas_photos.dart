import 'package:dafna_web/web/models/ideas_photos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IdeasPhotos extends StatelessWidget {
  const IdeasPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS ? forGrid.length ~/ 4 : forGrid.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS ? 2 : 4,
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
          return const Placeholder();
        },
      ),
    );
  }
}
