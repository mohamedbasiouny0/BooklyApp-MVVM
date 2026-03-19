import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/core/utils/failure_widget.dart';
import 'package:test2/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'list_tile_item.dart';

class ListTileListView extends StatelessWidget {
  const ListTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemCount: state.generalBooksList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTileItem(model: state.generalBooksList[index]);
            },
          );
        } else if (state is SearchBooksFailure) {
          return FailureWidget(errMessage: state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
