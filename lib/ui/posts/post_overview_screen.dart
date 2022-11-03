import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'post_grid.dart';

enum FilterOptions { favorites, all }

class PostsOverviewScreen extends StatefulWidget {
  const PostsOverviewScreen({super.key});

  @override
  State<PostsOverviewScreen> createState() => _PostsOverviewScreenState();
}

class _PostsOverviewScreenState extends State<PostsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        actions: <Widget>[
          buildPostFilterMenu(),
        ],
      ),
      body: PostsGrid(_showOnlyFavorites),
    );
  }

  Widget buildPostFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Bài viết yêu thích'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Tất cả bài viết'),
        ),
      ],
    );
  }
}
