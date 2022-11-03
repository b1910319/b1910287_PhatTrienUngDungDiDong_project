import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'post_grid_tile.dart';
import 'post_manager.dart';

class PostsGrid extends StatelessWidget {
  final bool showFavorites;
  const PostsGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final postManager = PostManager();
    final posts = showFavorites ? postManager.favoriteItems : postManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: posts.length,
      itemBuilder: (context, index) => PostGridTile(posts[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
