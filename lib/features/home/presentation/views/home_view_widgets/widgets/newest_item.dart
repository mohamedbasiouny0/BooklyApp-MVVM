import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/core/utils/styles.dart';
import 'package:test2/features/home/data/models/home_book_model/home_book_model.dart';

import 'book_image.dart';
import 'book_rating.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key, required this.bookModel});

  final HomeBookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .only(left: 16, right: 16, bottom: 16),
      height: 105 * 1.2,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(39),
        borderRadius: .circular(16),
      ),
      child: Row(
        children: [
          BookImage(imagePath: bookModel.image ?? ''),
          Gap(16),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: .only(top: 4),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    bookModel.title!,
                    overflow: .ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.inknutAntiqua().copyWith(fontSize: 20),
                  ),
                ),
                Gap(4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    bookModel.authors?[0].name ?? 'No author founded',
                    overflow: .ellipsis,
                    maxLines: 1,
                    style: Styles.style14.copyWith(color: Colors.amber),
                  ),
                ),
                Spacer(),
                BookRating(
                  mainAxisAlignment: .start,
                  rating: bookModel.rating?.average ?? 0,
                ),
                Gap(4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
