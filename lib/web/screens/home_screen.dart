// ignore_for_file: prefer_const_constructors

import 'package:dafna_web/web/models/colors.dart';
import 'package:dafna_web/web/widget/overview.dart';
import 'package:flutter/material.dart';
import '../widget/appbar_view.dart';
// import 'package:';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const AppBarView(),
        toolbarHeight: 120,
      ),
      body: OverView(),
    );
  }
}
