import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // ignore: prefer_final_fields
  List<dynamic> _item = const [
    'chegirma zonasi',
    'Divanlar',
    'Ofis stollari',
    'Kafe stollari',
    'Badiiy mebil',
    'Ovqatlanish stollari',
    'Kreslolar',
    'Tormali Sandiqlar',
    'Dekorlar',
    'To\'qimachilik',
    'CULTi dan lazzatlar',
    'AKIO',
    'Ofis mebillari',
    'Uy uchun mebillar',
    'Mehmonxona jihozlari',
    'Aksessuarlar mebillar '
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 620,
      width: 250,
      child: ListView.builder(
        itemCount: _item.length,
        itemBuilder: (context, index) {
          return ListTile(
            hoverColor: Colors.deepOrange.shade600,
            onTap: () {},
            title: Text(
              _item[index],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
