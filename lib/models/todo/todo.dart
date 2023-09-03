// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TODO {
  final String id;
  final String title;
  final String details;
  final bool isFinished;
  final String postedBy;
  TODO({
    required this.id,
    required this.title,
    required this.details,
    required this.isFinished,
    required this.postedBy,
  });

  TODO copyWith({
    String? id,
    String? title,
    String? details,
    bool? isFinished,
    String? postedBy,
  }) {
    return TODO(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      isFinished: isFinished ?? this.isFinished,
      postedBy: postedBy ?? this.postedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
      'isFinished': isFinished,
      'postedBy': postedBy,
    };
  }

  factory TODO.fromMap(Map<String, dynamic> map) {
    return TODO(
      id: map['id'] as String,
      title: map['title'] as String,
      details: map['details'] as String,
      isFinished: map['isFinished'] as bool,
      postedBy: map['postedBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TODO.fromJson(String source) =>
      TODO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TODO(id: $id, title: $title, details: $details, isFinished: $isFinished, postedBy: $postedBy)';
  }

  @override
  bool operator ==(covariant TODO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.details == details &&
        other.isFinished == isFinished &&
        other.postedBy == postedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        details.hashCode ^
        isFinished.hashCode ^
        postedBy.hashCode;
  }
}
