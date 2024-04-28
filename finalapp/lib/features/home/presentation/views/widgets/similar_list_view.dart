import 'package:finalapp/features/home/data/repos/home_repo_implement.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/book_details.dart';
import 'featured_item.dart';

class SimilarListView extends StatelessWidget {
  SimilarListView({
    super.key,
  });
  HomeRepoImplement homeRepoImplement = HomeRepoImplement();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksLoaded) {
            return ListView.builder(
                itemCount: state.similarBooks.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var model = state.similarBooks[index];
                  return GestureDetector(
                      onTap: () {
                        BlocProvider.of<SimilarBooksCubit>(context)
                            .fetchSimilarBooks(
                                cactegory:
                                    state.similarBooks[index].categories![0]??'everything');

                        Navigator.of(context)
                            .pushNamed(BookDetails.id, arguments: model);
                      },
                      child: FeaturedItem(
                        testModel: state.similarBooks[index],
                      ));
                });
          } else if (state is SimilarBooksLoading) {
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
