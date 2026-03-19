import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/core/utils/service_locator.dart';
import 'package:test2/features/search/data/repos/search_repo/search_repo_implem.dart';
import 'package:test2/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:test2/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBooksCubit(searchRepo: getIt<SearchRepoImplem>()),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(body: SearchViewBody()),
      ),
    );
  }
}
