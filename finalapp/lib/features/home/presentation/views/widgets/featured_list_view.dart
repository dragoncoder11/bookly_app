import 'package:finalapp/features/home/presentation/manager/cubit/featured_books_cubit.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/book_details.dart';
import 'featured_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
                itemCount: state.featuredBooks.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var model=state.featuredBooks[index];
                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(cactegory: state.featuredBooks[index].categories![0]??'everything');
                        Navigator.of(context).pushNamed(BookDetails.id,arguments:model );
                      },
                      child: FeaturedItem(
                        testModel: state.featuredBooks[index],
                      ));
                });
          } else if (state is FeaturedBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Text('failure');
        },
      ),
    );
  }
}
