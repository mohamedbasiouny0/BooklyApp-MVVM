import 'package:flutter/material.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_image.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_rating.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Text('title'),
          subtitle: Text('subTitle'),
          leading: BookImage(imagePath: '', borderRadius: .circular(6)),
          trailing: BookRating(rating: 0, mainAxisSize: .min),
        ),
        Divider(thickness: 2, height: 3),
      ],
    );
  }
}
