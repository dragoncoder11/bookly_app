import 'package:finalapp/core/utils/constants.dart';
import 'package:finalapp/features/home/data/repos/home_repo_implement.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/featured_books_cubit.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/newest_books_cubit.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:finalapp/features/home/presentation/views/screens/book_details.dart';
import 'package:finalapp/features/home/presentation/views/screens/home_page.dart';
import 'package:finalapp/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  HomeRepoImplement homeRepoImplement = HomeRepoImplement();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(homeRepoImplement)..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(homeRepoImplement)..fetchNewestBooks()),
                 BlocProvider(
            create: (context) =>
                SimilarBooksCubit(homeRepoImplement)..fetchSimilarBooks(cactegory: 'everything')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        initialRoute: SplashPage.id,
        routes: {
          HomePage.id: (context) => const HomePage(),
          SplashPage.id: (context) => const SplashPage(),
          BookDetails.id: (context) => const BookDetails(),
        },
      ),
    );
  }
}
