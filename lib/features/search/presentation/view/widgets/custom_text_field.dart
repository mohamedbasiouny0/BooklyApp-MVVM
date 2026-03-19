import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/features/search/presentation/manager/cubit/search_books_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      onSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context).getSearchBooks(q: value);
      },
      decoration: InputDecoration(
        suffix: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.search, color: Colors.grey.shade400),
        ),
        contentPadding: .only(left: 8),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 19),
        enabledBorder: underLineBorder(),
        focusedBorder: underLineBorder(),
      ),
    );
  }

  UnderlineInputBorder underLineBorder() {
    return UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
  }
}
