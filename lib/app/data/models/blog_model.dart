// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BlogModel {
          // fields = ["id", "title", "author", "excerpt", "content", "status", "slug", "category"]
  final int? id;
  final String? title;
  final String? author;
  final String? excerpt;
  final String? content;
  final String? status;
  final String? slug;
  final String? category;
  BlogModel({
    this.id,
    this.title,
    this.author,
    this.excerpt,
    this.content,
    this.status,
    this.slug,
    this.category,
  });
  

  BlogModel copyWith({
    int? id,
    String? title,
    String? author,
    String? excerpt,
    String? content,
    String? status,
    String? slug,
    String? category,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'excerpt': excerpt,
      'content': content,
      'status': status,
      'slug': slug,
      'category': category,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) => BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlogModel(id: $id, title: $title, author: $author, excerpt: $excerpt, content: $content, status: $status, slug: $slug, category: $category)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.author == author &&
      other.excerpt == excerpt &&
      other.content == content &&
      other.status == status &&
      other.slug == slug &&
      other.category == category;
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
      category.hashCode;
  }
}
