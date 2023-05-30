// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int number = 0;
  final List<dynamic> _item = ['Chegirma zonasi', 'Divanlar', 'Ofis stollari', 'Kafe stollari', 'Badiiy mebil', 'Ovqatlanish stollari', 'Kreslolar', 'Tortmali Sandiqlar', 'Dekorlar', 'To\'qimachilik', 'CULTi dan lazzatlar', 'AKIO', 'Ofis mebillari', 'Uy uchun mebillar', 'Mehmonxona jihozlari', 'Aksessuarlar mebillar '];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      // decoration: ,
      height: 600,
      width: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _item.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                number = index;
              });
              print(number);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: 250,
              height: 50,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: number == index ? Colors.orange : null,
              ),
              child: Text(
                _item[index],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MainDrawerIn extends StatefulWidget {
  const MainDrawerIn({super.key});

  @override
  State<MainDrawerIn> createState() => _MainDrawerInState();
}

class _MainDrawerInState extends State<MainDrawerIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 600,
      color: Colors.white,
      child: const Text(''),
    );
  }
}
