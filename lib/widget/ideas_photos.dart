import 'package:dafna_web/models/practick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IdeasPhotos extends StatelessWidget {
  const IdeasPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: column1.length,
            itemBuilder: (context, index) => Image.network(
              column1[index],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: column2.length,
            itemBuilder: (context, index) => Image.network(
              column2[index],
            ),
          ),
        ),
      ],
    );
  }
}
