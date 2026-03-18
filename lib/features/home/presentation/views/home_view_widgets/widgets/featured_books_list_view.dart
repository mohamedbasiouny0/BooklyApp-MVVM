import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';

import 'book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const .symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => context.push(AppRouter.bookDetailsViewPath),
            child: BookImage(),
          ),
        ),
      ),
    );
  }
}
