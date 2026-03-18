import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';
import 'package:test2/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/failure_widget.dart';

import 'book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 225,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const .symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouter.bookDetailsViewPath,
                      extra: state.books[index].id,
                    );
                  },
                  child: BookImage(imagePath: state.books[index].image ?? ''),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return FailureWidget(errMessage: state.ereMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
