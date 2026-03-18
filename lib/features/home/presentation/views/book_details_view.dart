import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test2/core/utils/app_colors.dart';
import 'book_details_widgets/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pimaryColor,
        leadingWidth: 60,
        leading: Padding(
          padding: const .only(left: 8),
          child: IconButton(
            enableFeedback: false,
            onPressed: () {
              context.pop();
            },
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
        actions: [
          Padding(
            padding: const .only(right: 10),
            child: IconButton(
              padding: .all(16),
              onPressed: () {},
              icon: Icon(CupertinoIcons.shopping_cart),
            ),
          ),
        ],
      ),
      body: BookDetailsViewBody(),
    );
  }
}
