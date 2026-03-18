import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test2/core/utils/styles.dart';
import 'package:test2/features/home/presentation/manager/get_book_information_cubit/get_book_information_cubit.dart';
import 'package:test2/core/utils/failure_widget.dart';

import '../../home_view_widgets/widgets/book_image.dart';
import '../../home_view_widgets/widgets/book_rating.dart';

class BookDetailsSection extends StatefulWidget {
  const BookDetailsSection({super.key});

  @override
  State<BookDetailsSection> createState() => _BookDetailsSectionState();
}

class _BookDetailsSectionState extends State<BookDetailsSection> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookInformationCubit, GetBookInformationState>(
      builder: (context, state) {
        if (state is GetBookInformationSuccess) {
          return Padding(
            padding: const .symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: BookImage(
                    imagePath: state.bookDetailsModel.image ?? '',
                  ),
                ),
                Gap(20),
                Text(
                  textAlign: .center,
                  state.bookDetailsModel.title!,
                  style: GoogleFonts.inknutAntiqua(fontSize: 25),
                ),
                Gap(5),
                Text(
                  textAlign: .center,
                  state.bookDetailsModel.authors?[0].name ?? 'No author found',
                  style: Styles.style18.copyWith(color: Colors.amber),
                ),
                Gap(5),
                BookRating(mainAxisAlignment: .center, rating: 0),
                Gap(10),
                Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      'Publish Date by year: ${state.bookDetailsModel.publishDate?.round()}',
                      style: Styles.style16.copyWith(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      'Pages count: ${state.bookDetailsModel.numberOfPages?.round()}',
                      style: Styles.style16.copyWith(
                        color: Colors.grey.shade400,
                      ),
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
                        state.bookDetailsModel.description ?? '',
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
        } else if (state is GetBookInformationFailure) {
          return FailureWidget(errMessage: state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
