import 'package:equatable/equatable.dart';

class SimilarBookModel extends Equatable {
  final int? id;
  final String? title;
  final String? image;

  const SimilarBookModel({this.id, this.title, this.image});

  factory SimilarBookModel.fromJson(Map<String, dynamic> json) => SimilarBookModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'image': image};

  @override
  List<Object?> get props => [id, title, image];
}
