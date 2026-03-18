import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test2/core/utils/styles.dart';
import 'custom_sliver_app_bar.dart';
import 'featured_books_list_view.dart';
import 'newest_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverToBoxAdapter(child: Gap(20)),
        SliverToBoxAdapter(child: FeaturedBooksListView()),
        SliverToBoxAdapter(
          child: Gap(MediaQuery.of(context).size.height * 0.055),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const .only(bottom: 25, left: 16),
            child: Text(
              'Newest List',
              style: Styles.style20.copyWith(fontWeight: .bold),
            ),
          ),
        ),
        // SliverFillRemaining(child: NewestBooksListView()),
      ],
    );
  }
}
