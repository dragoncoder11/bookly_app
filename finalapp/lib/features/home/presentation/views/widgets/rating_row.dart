import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        SizedBox(
          width: 2,
        ),
        Text('4.8'),
        SizedBox(
          width: 3,
        ),
        Text('(255)'),
      ],
    );
  }
}
