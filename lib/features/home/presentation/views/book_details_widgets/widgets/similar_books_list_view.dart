import 'package:flutter/material.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: .symmetric(horizontal: 8),
            child: BookImage(imagePath: ''),
          );
        },
      ),
    );
  }
}
