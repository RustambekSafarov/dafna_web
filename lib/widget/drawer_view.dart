import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // ignore: prefer_final_fields
  List<dynamic> _item = const [
    'Chegirma zonasi',
    'Divanlar',
    'Ofis stollari',
    'Kafe stollari',
    'Badiiy mebil',
    'Ovqatlanish stollari',
    'Kreslolar',
    'Tortmali Sandiqlar',
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
      height: 323 * 2,
      width: 250,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _item.length,
        itemBuilder: (context, index) {
          return ListTile(
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

class MainDrawerIn extends StatefulWidget {
  const MainDrawerIn({super.key});

  @override
  State<MainDrawerIn> createState() => _MainDrawerInState();
}

class _MainDrawerInState extends State<MainDrawerIn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
      ),
    );
  }
} 
