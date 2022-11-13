import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class PostsService extends FirebaseService {
  PostsService([AuthToken? authToken]) : super(authToken);
  //hiển thị danh sách bài viết
  Future<List<Post>> fetchPosts([bool filterByUser = false]) async {
    final List<Post> posts = [];
    try {
      final filters =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final postsUrl =
          Uri.parse('$databaseUrl/posts.json?auth=$token&$filters');
      final response = await http.get(postsUrl);
      final postsMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        print(postsMap['error']);
        return posts;
      }
      final userFavoritesUrl =
          Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      final userFavoritesResponse = await http.get(userFavoritesUrl);
      final userFavoritesMap = json.decode(userFavoritesResponse.body);
      postsMap.forEach((postId, post) {
        final isFavorite = (userFavoritesMap == null)
            ? false
            : (userFavoritesMap[postId] ?? false);
        posts.add(
          Post.fromJson({
            'id': postId,
            ...post,
          }).copyWith(isFavorite: isFavorite),
        );
      });
      return posts;
    } catch (error) {
      print(error);
      return posts;
    }
  }
  //thêm bài viết
  Future<Post?> addPost(Post post) async {
    try {
      final url = Uri.parse('$databaseUrl/posts.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(
          post.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return post.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }
  //cập nhật bài viết
  Future<bool> updatePost(Post post) async {
    try {
      final url =
          Uri.parse('$databaseUrl/posts/${post.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(post.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
  //xoá bài viết
  Future<bool> deletePost(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/posts/$id.json?auth=$token');
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
  //lưu bài viết yêu thích
  Future<bool> saveFavoriteStatus(Post post) async {
    try {
      final url = Uri.parse(
          '$databaseUrl/userFavorites/$userId/${post.id}.json?auth=$token');
      final response = await http.put(
        url,
        body: json.encode(
          post.isFavorite,
        ),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
