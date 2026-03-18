import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test2/core/utils/styles.dart';
import 'package:test2/features/home/presentation/views/book_details_widgets/widgets/book_details_section.dart';
import 'package:test2/features/home/presentation/views/home_view_widgets/widgets/book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookDetailsSection(),
          Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: .centerLeft,
              child: Text(
                'You can also like',
                style: Styles.style20.copyWith(fontWeight: .bold),
              ),
            ),
          ),
          Gap(20),
          SizedBox(
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
          ),
          Gap(30),
        ],
      ),
    );
  }
}
