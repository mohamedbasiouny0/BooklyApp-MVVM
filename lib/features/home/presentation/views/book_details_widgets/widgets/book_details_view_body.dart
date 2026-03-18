import 'package:flutter/material.dart';
import 'package:test2/features/home/presentation/views/book_details_widgets/widgets/book_details_secton.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: BookDetailsSecton());
  }
}
