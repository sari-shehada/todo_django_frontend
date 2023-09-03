// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TODOPostDTO {
  final String title;
  final String details;
  final bool isFinished;
  final String postedBy;
  TODOPostDTO({
    required this.title,
    required this.details,
    required this.isFinished,
    required this.postedBy,
  });

  TODOPostDTO copyWith({
    String? title,
    String? details,
    bool? isFinished,
    String? postedBy,
  }) {
    return TODOPostDTO(
      title: title ?? this.title,
      details: details ?? this.details,
      isFinished: isFinished ?? this.isFinished,
      postedBy: postedBy ?? this.postedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'details': details,
      'isFinished': isFinished,
      'postedBy': postedBy,
    };
  }

  factory TODOPostDTO.fromMap(Map<String, dynamic> map) {
    return TODOPostDTO(
      title: map['title'] as String,
      details: map['details'] as String,
      isFinished: map['isFinished'] as bool,
      postedBy: map['postedBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TODOPostDTO.fromJson(String source) =>
      TODOPostDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TODOPostDTO(title: $title, details: $details, isFinished: $isFinished, postedBy: $postedBy)';
  }

  @override
  bool operator ==(covariant TODOPostDTO other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.details == details &&
        other.isFinished == isFinished &&
        other.postedBy == postedBy;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        details.hashCode ^
        isFinished.hashCode ^
        postedBy.hashCode;
  }
}
