import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:SizedBox(height: MediaQuery.of(context).size.height*.4,width: double.infinity,
    child: Lottie.asset('assets/book.json')) ,);
  }
}