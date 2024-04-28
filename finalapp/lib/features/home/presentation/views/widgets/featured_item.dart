import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../data/models/test_model.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.testModel});
  final TestModel testModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .27,
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl:testModel.image! ,fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
