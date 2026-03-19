// ignore_for_file: use_build_context_synchronously

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test2/features/search/presentation/manager/cubit/search_books_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final PublishSubject<String> subject = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    subject.debounceTime(Duration(milliseconds: 600)).distinct().listen((
      String q,
    ) {
      if (q.trim().isNotEmpty) {
        context.read<SearchBooksCubit>().getSearchBooks(q: q);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      onChanged: (value) {
        subject.add(value);
      },
      decoration: InputDecoration(
        suffix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(CupertinoIcons.search, color: Colors.grey.shade400),
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
