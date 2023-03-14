// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dafna_web/web/models/colors.dart';
import 'package:dafna_web/web/widget/drawer_view.dart';
import 'package:dafna_web/web/widget/overview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../widget/appbar_view.dart';
import '../widget/footer.dart';

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
