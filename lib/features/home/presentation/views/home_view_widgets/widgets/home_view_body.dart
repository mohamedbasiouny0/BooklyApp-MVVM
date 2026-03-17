import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test2/core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [CustomSliverAppBar()]);
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const .only(left: 16),
        child: SvgPicture.asset(Assets.logo),
      ),
      leadingWidth: 90,
      backgroundColor: Colors.transparent,
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
