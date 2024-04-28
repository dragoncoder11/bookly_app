import 'package:finalapp/features/home/data/models/test_model.dart';
import 'package:finalapp/features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/book_details_body.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, });
static String id='book details';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailsBody(),
    );
  }
}