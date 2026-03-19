import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test2/features/search/presentation/view/widgets/custom_text_field.dart';

import 'list_tile_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const .symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomTextField(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTileItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
