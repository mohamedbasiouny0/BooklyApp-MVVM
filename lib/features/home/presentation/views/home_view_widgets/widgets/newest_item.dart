import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/core/utils/styles.dart';

import 'book_image.dart';
import 'book_rating.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key});

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
          BookImage(imagePath: ''),
          Gap(16),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: .only(top: 4),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',
                    overflow: .ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.inknutAntiqua().copyWith(fontSize: 20),
                  ),
                ),
                Gap(4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'J.K. Rowling',
                    overflow: .ellipsis,
                    maxLines: 1,
                    style: Styles.style14.copyWith(color: Colors.amber),
                  ),
                ),
                Spacer(),
                BookRating(mainAxisAlignment: .start),
                Gap(4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
