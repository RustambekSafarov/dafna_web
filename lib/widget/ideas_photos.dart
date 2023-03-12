import 'dart:io';

import 'package:dafna_web/models/practick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IdeasPhotos extends StatelessWidget {
  const IdeasPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: Platform.isAndroid ? forGrid.length ~/ 4 : forGrid.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Platform.isAndroid ? 2 : 4,
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

    // Row(
    //   children: [
    //     Column(
    //       children: [
    //         Image.network(column1[0]),
    //         Image.network(column1[1]),
    //         Image.network(column1[2]),
    //         Image.network(column1[3]),
    //         Image.network(column1[4]),
    //         Image.network(column1[5]),
    //         Image.network(column1[6]),
    //         Image.network(column1[7]),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Image.network(column2[0]),
    //         Image.network(column2[1]),
    //         Image.network(column2[2]),
    //         Image.network(column2[3]),
    //         Image.network(column2[4]),
    //         Image.network(column2[5]),
    //         Image.network(column2[6]),
    //         Image.network(column2[7]),
    //         Image.network(column2[8]),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Image.network(column3[0]),
    //         Image.network(column3[1]),
    //         Image.network(column3[2]),
    //         Image.network(column3[3]),
    //         Image.network(column3[4]),
    //         Image.network(column3[5]),
    //         Image.network(column3[6]),
    //         Image.network(column3[7]),
    //         Image.network(column3[8]),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Image.network(column4[0]),
    //         Image.network(column4[1]),
    //         Image.network(column4[2]),
    //         Image.network(column4[3]),
    //         Image.network(column4[4]),
    //         Image.network(column4[5]),
    //         Image.network(column4[6]),
    //         Image.network(column4[7]),
    //         Image.network(column4[8]),
    //       ],
    //     ),
    //   ],
    // );
  }
}
