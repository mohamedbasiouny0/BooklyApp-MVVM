import 'package:equatable/equatable.dart';

class Identifiers extends Equatable {
	final String? openLibraryId;
	final String? isbn10;
	final String? isbn13;

	const Identifiers({this.openLibraryId, this.isbn10, this.isbn13});

	factory Identifiers.fromJson(Map<String, dynamic> json) => Identifiers(
				openLibraryId: json['open_library_id'] as String?,
				isbn10: json['isbn_10'] as String?,
				isbn13: json['isbn_13'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'open_library_id': openLibraryId,
				'isbn_10': isbn10,
				'isbn_13': isbn13,
			};

	@override
	List<Object?> get props => [openLibraryId, isbn10, isbn13];
}
