import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/core/utils/assets.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: .circular(20),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: .fill,
          errorBuilder: (context, url, error) =>
              Icon(CupertinoIcons.exclamationmark),
        ),
      ),
    );
  }
}
