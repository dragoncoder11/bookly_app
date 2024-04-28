import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../data/models/test_model.dart';
import 'rating_row.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({super.key, required this.test, });
  final TestModel test;
 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:const  EdgeInsets.only(right: 25, bottom: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 3/4,
                child: CachedNetworkImage(
                  imageUrl:test.image! ,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  test.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16Bold,
                ),
              ),
               Text(test.publisher??''),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '19.99\$',
                  ),
                  RatingRow(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
