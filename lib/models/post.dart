class Post {
  final String? id;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final bool isFavorite;
  Post({
    this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    this.isFavorite = false,
  });
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
}
