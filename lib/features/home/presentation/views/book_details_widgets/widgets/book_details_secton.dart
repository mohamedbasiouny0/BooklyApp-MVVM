import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/core/utils/styles.dart';

import '../../home_view_widgets/widgets/book_image.dart';
import '../../home_view_widgets/widgets/book_rating.dart';

class BookDetailsSecton extends StatefulWidget {
  const BookDetailsSecton({super.key});

  @override
  State<BookDetailsSecton> createState() => _BookDetailsSectonState();
}

class _BookDetailsSectonState extends State<BookDetailsSecton> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.49,
            child: BookImage(imagePath: ''),
          ),
          Gap(20),
          Text(
            textAlign: .center,
            'Harry Potter and the Goblet of Fire',
            style: GoogleFonts.inknutAntiqua(fontSize: 25),
          ),
          Gap(5),
          Text(
            textAlign: .center,
            'J.K. Rowling',
            style: Styles.style18.copyWith(color: Colors.amber),
          ),
          Gap(5),
          BookRating(mainAxisAlignment: .center),
          Gap(10),
          Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                'Publish Date: 1988',
                style: Styles.style16.copyWith(color: Colors.grey.shade400),
              ),
              Text(
                'Pages count: 288',
                style: Styles.style16.copyWith(color: Colors.grey.shade400),
              ),
              Gap(20),
              Text(
                'Describtion:',
                style: Styles.style20.copyWith(fontWeight: .bold),
              ),
              GestureDetector(
                onTap: () {
                  tapped = !tapped;
                  setState(() {});
                },
                child: Text(
                  'data bsjkbdsabjkasadsjkjhkdsahjkdshdshakadsfhjkdsfhjkdfhjksfdshjkfhjkdhjkdfshjkfdshjkfhjafshjasfhsafhldjsfhjkladjhafsdhjlksfajhasfkdlkfhjadslfhjdsklhdsfjalkfhjdsklahjdsflkhjdsflhsfjdlaksfadhjklafdhjklfadshjkldfhjkldfshjkldfshjklfsdahjklafhjklsdfjhkfshjksahjklfhjkdsfilweanicfwoefynewfhuewifhiruegfiulcranlflgcarhjkgfarngkfqnaegrujflgerjakfngbjrakngfbcrakgyufjergyukhbjfkewgyuhfgyuewhfyhjbnfhyubksdhjkcndshuijklnfuirshgfyuihjrwguihjknwrjiof',
                  style: Styles.style14,
                  maxLines: tapped ? 400 : 4,
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
