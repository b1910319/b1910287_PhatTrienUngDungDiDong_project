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
  //hiển thị bài viết
  Future<void> fetchPosts([bool filterByUser = false]) async {
    _items = await _postsService.fetchPosts(filterByUser);
    notifyListeners();
  }
  //thêm bài viết
  Future<void> addPost(Post post) async {
    final newPost = await _postsService.addPost(post);
    if (newPost != null) {
      _items.add(newPost);
      notifyListeners();
    }
  }
  //đếm số bài viết
  int get itemCount {
    return _items.length;
  }

  List<Post> get items {
    return [..._items];
  }
  //lấy bài viết yêu thích
  List<Post> get favoriteItems {
    return _items.where((postItem) => postItem.isFavorite).toList();
  }
  //lấy bài viết theo id
  Post findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
  //cập nhật thông tin bài viết
  Future<void> updatePost(Post post) async {
    final index = _items.indexWhere((item) => item.id == post.id);
    if (index >= 0) {
      if (await _postsService.updatePost(post)) {
        _items[index] = post;
        notifyListeners();
      }
    }
  }
  //xoá bài viết
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
  //chọn bài viết yêu thích
  Future<void> tonggleFavoriteStatus(Post post) async {
    final savedStatus = post.isFavorite;
    post.isFavorite = !savedStatus;
    if (!await _postsService.saveFavoriteStatus(post)) {
      post.isFavorite = savedStatus;
    }
  }
}
