import 'package:flutter/material.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String id='home page';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:HomePageBody() ,
    );
  }
}