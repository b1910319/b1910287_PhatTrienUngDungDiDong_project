import '../../models/post.dart';
import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
import '../../services/posts_sevice.dart';

class PostManager with ChangeNotifier {
  List<Post> _items = [];
  final PostsService _postsService;
  PostManager([AuthToken? authToken]) : _postsService = PostsService(authToken);
  set authToken(AuthToken? authToken) {
    _postsService.authToken = authToken;
  }
  Future<void> fetchPosts([bool filterByUser = false]) async {
    _items = await _postsService.fetchPosts(filterByUser);
    notifyListeners();
  }

  Future<void> addPost(Post post) async {
    final newPost = await _postsService.addPost(post);
    if (newPost != null) {
      _items.add(newPost);
      notifyListeners();
    }
  }
  int get itemCount {
    return _items.length;
  }

  List<Post> get items {
    return [..._items];
  }

  List<Post> get favoriteItems {
    return _items.where((postItem) => postItem.isFavorite).toList();
  }

  Post findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> updatePost(Post post) async {
    final index = _items.indexWhere((item) => item.id == post.id);
    if (index >= 0) {
      if (await _postsService.updatePost(post)) {
        _items[index] = post;
        notifyListeners();
      }
    }
  }

  Future<void> deletePost(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Post? existingPost = _items[index];
    _items.remove(index);
    notifyListeners();
    if (!await _postsService.deletePost(id)) {
      _items.insert(index, existingPost);
      notifyListeners();
    }
  }

  // Future<void> tonggleFavoriteStatus(Post post) async {
  //   final savedStatus = post.isFavorite;
  //   post.isFavorite = !savedStatus;
  //   if (!await _postsService.saveFavoriteStatus(product)) {
  //     product.isFavorite = savedStatus;
  //   }
  // }
}
