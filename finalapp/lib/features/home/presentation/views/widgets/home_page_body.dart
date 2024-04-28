import 'package:finalapp/core/utils/styles.dart';
import 'package:finalapp/features/home/presentation/views/screens/book_details.dart';
import 'package:finalapp/features/home/presentation/views/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';

import 'featured_list_view.dart';
import 'newest_books_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Bookly',style:Styles.styles18Bold ,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
           const SliverToBoxAdapter(
              child:  FeaturedListView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
             SliverToBoxAdapter(
              child: Text('Newest Books',style:Styles.style16Bold ,),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
           const SliverFillRemaining(
              child: NewestBooksListView(),
            ),
          ],
        ),
      ),
    );
  }
}
