import 'package:flutter/foundation.dart';

class Post {
  final String? id;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final ValueNotifier<bool> _isFavorite;
  Post({
    this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Post copyWith({
    String? id,
    String? title,
    String? content,
    String? imageUrl,
    String? author,
    bool? isFavorite,
  }) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        imageUrl: imageUrl ?? this.imageUrl,
        author: author ?? this.author,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'author': author,
    };
  }

  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      author: json['author'],
    );
  }
}
