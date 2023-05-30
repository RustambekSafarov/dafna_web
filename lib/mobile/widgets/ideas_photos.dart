import 'package:dafna_web/web/models/ideas_photos.dart';
import 'package:flutter/material.dart';

class IdeasPhotosM extends StatelessWidget {
  const IdeasPhotosM({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: forGrid.length ~/ 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
