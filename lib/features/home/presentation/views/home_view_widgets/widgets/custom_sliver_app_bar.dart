import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test2/core/utils/app_colors.dart';
import 'package:test2/core/utils/assets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const .only(left: 16),
        child: SvgPicture.asset(Assets.logo),
      ),
      pinned: true,
      leadingWidth: 90,
      backgroundColor: AppColors.pimaryColor,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 70,
      actions: [
        Padding(
          padding: const .only(right: 8),
          child: IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search),
          ),
        ),
      ],
    );
  }
}
