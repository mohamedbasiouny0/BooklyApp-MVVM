import 'package:equatable/equatable.dart';

import 'author.dart';
import 'rating.dart';

class HomeBookModel extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final List<Author>? authors;
  final Rating? rating;
  final num? publishDate;
  const HomeBookModel({
    this.id,
    this.title,
    this.image,
    this.authors,
    this.rating,
    this.publishDate,
  });

  factory HomeBookModel.fromJson(Map<String, dynamic> json) => HomeBookModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    image: json['image'] as String?,
    authors: (json['authors'] as List<dynamic>?)
        ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
        .toList(),
    rating: json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    publishDate: json['publish_date'] == null
        ? null
        : json['publish_date'] as num,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
    'authors': authors?.map((e) => e.toJson()).toList(),
    'rating': rating?.toJson(),
  };

  @override
  List<Object?> get props => [id, title, image, authors, rating];
}
