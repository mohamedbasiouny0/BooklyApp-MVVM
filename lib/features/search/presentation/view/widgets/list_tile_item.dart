import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';
import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_image.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_rating.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({super.key, required this.model});
  final GeneralBookModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.push(AppRouter.bookDetailsViewPath, extra: model.id);
          },
          title: Text(model.title!),
          subtitle: Text(model.authors?[0].name ?? 'No author found'),
          leading: BookImage(
            imagePath: model.image ?? '',
            borderRadius: .circular(6),
          ),
          trailing: BookRating(
            rating: model.rating?.average ?? 0,
            mainAxisSize: .min,
          ),
        ),
        Divider(thickness: 2, height: 3),
      ],
    );
  }
}
