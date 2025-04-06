import 'package:flutter/material.dart';
import 'view/show_app_icon_page.dart';

class TLIconMakerApp extends StatelessWidget {
  const TLIconMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowAppIconPage(),
    );
  }
}
