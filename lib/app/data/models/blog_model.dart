// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/data/models/profile_model.dart';

class BlogModel {
  final int? id;
  final String? title;
  final ProfileModel? author;
  final String? excerpt;
  final String? content;
  final String? status;
  final String? slug;
  final CategoryModel? category;
  final DateTime? published;
  final String? thumbnail;
  BlogModel({
    this.id,
    this.title,
    this.author,
    this.excerpt,
    this.content,
    this.status,
    this.slug,
    this.category,
    this.published,
    this.thumbnail,
  });

  BlogModel copyWith({
    int? id,
    String? title,
    ProfileModel? author,
    String? excerpt,
    String? content,
    String? status,
    String? slug,
    CategoryModel? category,
    DateTime? published,
    String? thumbnail,
  }) {
    return BlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      excerpt: excerpt ?? this.excerpt,
      content: content ?? this.content,
      status: status ?? this.status,
      slug: slug ?? this.slug,
      category: category ?? this.category,
      published: published ?? this.published,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author?.toMap(),
      'excerpt': excerpt,
      'content': content,
      'status': status,
      'slug': slug,
      'category': category?.toMap(),
      'published': published?.millisecondsSinceEpoch,
      'thumbnail': thumbnail,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      author: map['author'] != null
          ? ProfileModel.fromMap(map['author'] as Map<String, dynamic>)
          : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'] as Map<String, dynamic>)
          : null,
      published:
          map['published'] != null ? DateTime.tryParse(map['published']) : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlogModel(id: $id, title: $title, author: $author, excerpt: $excerpt, content: $content, status: $status, slug: $slug, category: $category, published: $published, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.author == author &&
        other.excerpt == excerpt &&
        other.content == content &&
        other.status == status &&
        other.slug == slug &&
        other.category == category &&
        other.published == published &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        excerpt.hashCode ^
        content.hashCode ^
        status.hashCode ^
        slug.hashCode ^
        category.hashCode ^
        published.hashCode ^
        thumbnail.hashCode;
  }
}
