import 'package:dafna_web/widget/overview.dart';
import 'package:flutter/material.dart';
import '../widget/appbar_view.dart';
import '../widget/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarView(),
        toolbarHeight: 120,
      ),
      body: const OverView(),
      // bottomNavigationBar: const Footer(),
    );
  }
}
