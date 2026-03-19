import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_router.dart';
import 'package:test2/core/utils/failure_widget.dart';
import 'package:test2/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: state.similarBooksList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: .symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouter.bookDetailsViewPath,
                        extra: state.similarBooksList[index].id,
                      );
                    },
                    child: BookImage(
                      imagePath: state.similarBooksList[index].image ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return FailureWidget(errMessage: state.message);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
