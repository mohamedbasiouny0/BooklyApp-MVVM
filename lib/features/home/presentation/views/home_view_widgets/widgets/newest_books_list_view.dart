import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';
import 'newest_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.push(AppRouter.bookDetailsViewPath),
        child: NewestItem(),
      ),
    );
  }
}
