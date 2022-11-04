import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'user_post_list_tile.dart';
import 'post_manager.dart';
import '../shared/app_drawer.dart';
import 'edit_post_screen.dart';
import 'package:provider/provider.dart';
class UserPostsScreen extends StatelessWidget {
  static const routeName = '/user-post';
  const UserPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postManager = PostManager();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bài viết'),
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh post'),
        child: buildUserPostListView(postManager),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditPostScreen.routeName,
          );
          print('go to add post screen');
        },
        backgroundColor: Color(0xFFFF6D28),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildUserPostListView(PostManager postManager) {
    return Consumer<PostManager>(
      builder: (ctx, postManager, child) {
        return ListView.builder(
          itemCount: postManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserPostListTile(
                postManager.items[i],
              ),
              const Divider(
                color: Color(0xFFDC5F00),
              ),
            ],
          ),
        );
      },
    );
  }
}
