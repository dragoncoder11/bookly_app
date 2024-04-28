import 'package:finalapp/features/home/presentation/manager/cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/similar_books_cubit.dart';
import '../screens/book_details.dart';
import 'newest_books_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              itemCount: state.newestBooks.length,
              itemBuilder: (context, index) {
                var model = state.newestBooks[index];
                return GestureDetector(
                    onTap: () {
                      BlocProvider.of<SimilarBooksCubit>(context)
                          .fetchSimilarBooks(
                              cactegory:
                                  state.newestBooks[index].categories![0]??'everything');

                      Navigator.of(context)
                          .pushNamed(BookDetails.id, arguments: model);
                    },
                    child: NewestBooksItem(
                      test: state.newestBooks[index],
                    ));
              });
        } else if (state is NewestBooksLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Text('failure');
      },
    );
  }
}
