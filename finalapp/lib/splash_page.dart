import 'package:finalapp/features/home/presentation/views/screens/home_page.dart';
import 'package:finalapp/splash_page_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
static String id='splash';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.popAndPushNamed(context, HomePage.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashPageBody(),
    );
  }
}