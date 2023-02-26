import 'package:dafna_web/widget/appbar_view.dart';
import 'package:flutter/material.dart';

class VideoViewScreen extends StatelessWidget {
  const VideoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122,
        title: const AppBarView(),
      ),
    );
  }
}
