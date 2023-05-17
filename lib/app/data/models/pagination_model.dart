// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaginationModel {
  final String? next;
  final String? previous;
  final int? count;
  PaginationModel({
    this.next,
    this.previous,
    this.count,
  });

  PaginationModel copyWith({
    String? next,
    String? previous,
    int? count,
  }) {
    return PaginationModel(
      next: next ?? this.next,
      previous: previous ?? this.previous,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'next': next,
      'previous': previous,
      'count': count,
    };
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      next: map['next'] != null ? map['next'] as String : null,
      previous: map['previous'] != null ? map['previous'] as String : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) => PaginationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PaginationModel(next: $next, previous: $previous, count: $count)';

  @override
  bool operator ==(covariant PaginationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.next == next &&
      other.previous == previous &&
      other.count == count;
  }

  @override
  int get hashCode => next.hashCode ^ previous.hashCode ^ count.hashCode;
}
