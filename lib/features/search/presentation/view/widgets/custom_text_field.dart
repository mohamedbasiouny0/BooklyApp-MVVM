import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/features/search/presentation/manager/cubit/search_books_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          BlocProvider.of<SearchBooksCubit>(
            context,
          ).getSearchBooks(q: _controller.text);
        }
      },
      decoration: InputDecoration(
        suffix: IconButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              BlocProvider.of<SearchBooksCubit>(
                context,
              ).getSearchBooks(q: _controller.text);
            }
          },
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
