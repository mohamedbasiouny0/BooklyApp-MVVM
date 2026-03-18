import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';
import 'package:test2/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/failure_widget.dart';
import 'newest_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.push(AppRouter.bookDetailsViewPath),
              child: NewestItem(bookModel: state.books[index]),
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: FailureWidget(errMessage: state.errMessage),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
