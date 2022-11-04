import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:review/ui/posts/post_manager.dart';
import '../../models/post.dart';
import 'package:provider/provider.dart';
class UserPostListTile extends StatelessWidget {
  final Post post;
  const UserPostListTile(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(post.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('go to edit post screen');
      },
      icon: const Icon(Icons.edit_note),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<PostManager>().deletePost(post.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Post deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      icon: const Icon(Icons.delete_sweep),
      color: Color(0xFFE0144C),
    );
  }
}
